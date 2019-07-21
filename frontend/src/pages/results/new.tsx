import Router from 'next/router'
import * as React from 'react'

import Container from '@app/components/atoms/Container'
import RegisterResultForm from '@app/components/organisms/RegisterResultForm'
import MainLayout from '@app/components/templates/MainLayout'
import { RegisterResultsWithCsvComponent } from '@app/queries'

const ResultsNew = () => (
  <MainLayout>
    <RegisterResultsWithCsvComponent>
      {registerResultsWithCSV => (
        <Container>
          <RegisterResultForm
            onSubmit={async ({ csv, playStyle }) => {
              await registerResultsWithCSV({
                variables: { csv, playStyle },
              })
              Router.push('/')
            }}
          />
        </Container>
      )}
    </RegisterResultsWithCsvComponent>
  </MainLayout>
)

export default ResultsNew