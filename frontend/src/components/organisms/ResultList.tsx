import * as _ from 'lodash'
import ErrorPage from 'next/error'
import * as React from 'react'
import { Divider } from 'semantic-ui-react'

import ResultTable from '@app/components/molecules/ResultTable'
import ResultSearchForm, {
  FormValues,
} from '@app/components/organisms/ResultSearchForm'
import { GetUserResultsComponent } from '@app/queries'
import { Router } from '@app/routes'

export type Props = {
  screenName: string
  initialValues: FormValues
  onSubmit: (values: FormValues) => void
}

const ResultList: React.SFC<Props> = ({
  screenName,
  initialValues,
  onSubmit,
}) => {
  const [formValues, setFormValues] = React.useState<FormValues>(initialValues)

  return (
    <>
      <ResultSearchForm
        initialValues={initialValues}
        onSubmit={values => {
          setFormValues(values)
          onSubmit(values)
        }}
      />
      <Divider />
      <GetUserResultsComponent
        variables={{
          username: screenName,
          title: formValues.title,
          playStyle: formValues.playStyle,
          difficulties: formValues.difficulties,
          levels: formValues.levels,
        }}
      >
        {({ loading, error, data }) => {
          if (loading) {
            return 'loading'
          }
          if (error || !data || !data.searchMaps) {
            return <ErrorPage statusCode={404} />
          }

          return (
            <ResultTable
              showMapData
              maps={_.map(
                data.searchMaps,
                ({ bestResult: result, ...maps }) => ({ ...maps, result }),
              )}
              onClickRow={({ music, playStyle, difficulty }) => {
                if (screenName && music) {
                  Router.pushRoute('map', {
                    screenName,
                    musicId: music.id,
                    playStyle: playStyle.toLowerCase(),
                    difficulty: difficulty.toLowerCase(),
                  })
                }
              }}
            />
          )
        }}
      </GetUserResultsComponent>
    </>
  )
}

export default ResultList
