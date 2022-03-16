resource RSV_01_AzureVmWorkloadProtectionPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2021-12-01' = {
  name: 'RSV-01/AzureVmWorkloadProtectionPolicy'
  location: 'centralus'
  tags: {
    TagName: 'TagValue'
  }
  properties: {
    backupManagementType: 'AzureWorkload'
    makePolicyConsistent: true
    settings: {
      isCompression: false
      issqlcompression: false
      timeZone: 'Eastern Standard Time'
    }
    subProtectionPolicy: [
      {
        policyType: 'Incremental'
        retentionPolicy: {
          retentionPolicyType: 'LongTermRetentionPolicy'
          dailySchedule: {
            retentionTimes: [
              '2021-03-15T02:30:00Z'
            ]
            retentionDuration: {
              count: 15
              durationType: 'Days'
            }
          }
          weeklySchedule: {
            daysOfTheWeek: [
              'Sunday'
            ]
            retentionDuration: {
              count: 7
              durationType: 'Weeks'
            }
            retentionTimes: [
              '2021-03-15T02:30:00Z'
            ]
          }
          monthlySchedule: {
            retentionDuration: {
              count: 120
              durationType: 'Months'
            }
            retentionScheduleDaily: {
              daysOfTheMonth: [
                {
                  date: 1
                  isLast: false
                }
              ]
            }
            retentionScheduleFormatType: 'Weekly'
            retentionScheduleWeekly: {
              daysOfTheWeek: [
                'Sunday'
              ]
              weeksOfTheMonth: [
                'First'
              ]
            }
            retentionTimes: [
              '2021-03-15T02:30:00Z'
            ]
          }
          yearlySchedule: {
            monthsOfYear: [
              'January'
            ]
            retentionDuration: {
              count: 68
              durationType: 'Years'
            }
            retentionScheduleDaily: {
              daysOfTheMonth: [
                {
                  date: 1
                  isLast: false
                }
              ]
            }
            retentionScheduleFormatType: 'Weekly'
            retentionScheduleWeekly: {
              daysOfTheWeek: [
                'Sunday'
              ]
              weeksOfTheMonth: [
                'First'
              ]
            }
            retentionTimes: [
              '2021-03-15T02:30:00Z'
            ]
          }
        }
        schedulePolicy: {
          schedulePolicyType: 'SimpleSchedulePolicy'
          scheduleRunDays: [
            'Sunday'
          ]
          scheduleRunFrequency: 'Weekly'
          scheduleRunTimes: [
            '2021-03-15T02:30:00Z'
          ]
          scheduleWeeklyFrequency: 1
        }
      }
    ]
    workLoadType: 'SystemState'
  }
  dependsOn: []
}
