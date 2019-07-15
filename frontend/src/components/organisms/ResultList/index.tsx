import * as classnames from 'classnames/bind'
import * as _ from 'lodash'
import ErrorPage from 'next/error'
import * as React from 'react'

import Container from '@app/components/atoms/Container'
import Pagination from '@app/components/atoms/Pagination'
import ResultTable, {
  Props as ResultTableProps,
} from '@app/components/molecules/ResultTable'
import { FormValues } from '@app/components/organisms/FilterForm'
import { GetUserResultsComponent, PlayStyle } from '@app/queries'

import * as css from './style.scss'

const cx = classnames.bind(css)

export type Props = {
  formValues: FormValues
  playStyle: PlayStyle
  screenName: string
  activePage: number
  numItemsPerPage?: number
  onPageChange?: ResultTableProps['onPageChange']
}

const ResultList: React.SFC<Props> = ({
  formValues: { title, difficulties, levels },
  playStyle,
  screenName,
  onPageChange,
  numItemsPerPage = 20,
  activePage,
}) => {
  const changePage = (newActivePage: number) => {
    if (onPageChange) {
      onPageChange(newActivePage)
    }
  }

  return (
    <Container>
      <div className={cx('result-list')}>
        <div className={cx('table-wrapper')}>
          <GetUserResultsComponent
            variables={{
              username: screenName,
              title,
              playStyle,
              difficulties,
              levels,
            }}
          >
            {({ loading, error, data }) => {
              if (loading) {
                return 'loading'
              }
              if (error || !data || !data.searchMaps) {
                return <ErrorPage statusCode={404} />
              }

              const maps = _.map(data.searchMaps, ({ result, ...map }) => ({
                ...map,
                result,
              }))

              const totalPages = Math.ceil(maps.length / numItemsPerPage)
              const partialMaps = maps.slice(
                (activePage - 1) * numItemsPerPage,
                activePage * numItemsPerPage,
              )

              const pagination = (
                <Pagination
                  onPageChange={changePage}
                  totalPages={totalPages}
                  activePage={activePage}
                />
              )

              return (
                <>
                  <div className={cx('pagination', 'top')}>{pagination}</div>
                  <ResultTable
                    showBPI
                    maps={partialMaps}
                    screenName={screenName}
                  />
                  <div className={cx('pagination', 'bottom')}>{pagination}</div>
                </>
              )
            }}
          </GetUserResultsComponent>
        </div>
      </div>
    </Container>
  )
}

export default ResultList
