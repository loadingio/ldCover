icon = do
  svg: '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">'''
  success: '''<g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0);animation: 1.1s linear 0.15s 1 forwards bounce-in"><path fill="#849B87" d="M50 13c20.4 0 37 16.6 37 37S70.4 87 50 87 13 70.4 13 50s16.6-37 37-37m0-3c-22.1 0-40 17.9-40 40s17.9 40 40 40 40-17.9 40-40-17.9-40-40-40z"/></g><g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0); animation: 1.1s linear 1 forwards bounce-in"><path fill="none" stroke="#ACBD81" stroke-width="3" d="M27.5 52l15 15 30-30"/></g>'''
  warning: '''
  <g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0);animation:1.1s linear 0.15s 1 forwards bounce-in"><path fill="#F47E5F" d="M50 13c20.4 0 37 16.6 37 37S70.4 87 50 87 13 70.4 13 50s16.6-37 37-37m0-3c-22.1 0-40 17.9-40 40s17.9 40 40 40 40-17.9 40-40-17.9-40-40-40z"/></g><g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0);animation: 1.1s linear 1 forwards bounce-in"><path fill="none" stroke="#F7B26A" stroke-width="3" d="M50 65.9v5.3M50 28.8v29.7"/></g>'''
  info: '''<g style="transform:matrix(0,0,0,0,0,0);transform-origin:50px 50px;animation:1.1s linear 0.1s 1 forwards bounce-in"><path fill="#77A4BD" d="M50 13c20.4 0 37 16.6 37 37S70.4 87 50 87 13 70.4 13 50s16.6-37 37-37m0-3c-22.1 0-40 17.9-40 40s17.9 40 40 40 40-17.9 40-40-17.9-40-40-40z"/></g><g style="transform:matrix(0,0,0,0,0,0);transform-origin:50px 50px; animation: 1.1s linear 1 forwards bounce-in"><path fill="none" stroke="#A0C8D7" stroke-width="3" d="M50 34.1v-5.3M50 71.2V41.5"/></g>'''
  question: '''<g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0);animation: 1.1s linear .15s 1 forwards bounce-in"><path fill="#77A4BD" d="M50 13c20.4 0 37 16.6 37 37S70.4 87 50 87 13 70.4 13 50s16.6-37 37-37m0-3c-22.1 0-40 17.9-40 40s17.9 40 40 40 40-17.9 40-40-17.9-40-40-40z"/></g><g style="transform-origin:50px 50px;transform:matrix(0,0,0,0,0,0);animation: 1.1s linear 1 forwards bounce-in"><path fill="none" stroke="#A0C8D7" stroke-width="3" d="M50 66v5.2M38.9 40.6c0-6.3 5.2-11.3 11.5-11.1 5.7.2 10.4 4.9 10.6 10.6.2 4.8-2.7 9-6.8 10.7-2.5 1.1-4.2 4.4-4.2 7.2v4"/></g>'''
  error: '''<g style="transform-origin:50px 50px;transform:matrix(0, 0, 0, 0, 0, 0);animation:1.1s linear .15s 1 forwards bounce-in"><path fill="#C33837" d="M50 13c20.4 0 37 16.6 37 37S70.4 87 50 87 13 70.4 13 50s16.6-37 37-37m0-3c-22.1 0-40 17.9-40 40s17.9 40 40 40 40-17.9 40-40-17.9-40-40-40z" style="fill:rgb(195, 56, 55)"/></g><g style="transform-origin:50px 50px;transform:matrix(0, 0, 0, 0, 0, 0);animation:1.1s linear 1 forwards bounce-in"><path fill="none" stroke="#E15C64" stroke-width="3" d="M35 35l30 30M35 65l30-30"/></g>'''
  bounce: """<style>@keyframes bounce-in { 0% { animation-timing-function: cubic-bezier(0.3333,0.3333,0.1967,0.6667); transform: matrix(0.01,0,0,0.01,0,0); } 0.2% { animation-timing-function: cubic-bezier(0.01,0.3328,0.5571,0.6713); transform: matrix(0.469,0,0,0.469,0,0); } 4.5% { animation-timing-function: cubic-bezier(0.1196,0.2101,0.11,0.885); transform: matrix(0.863,0,0,0.863,0,0); } 9.9% { animation-timing-function: cubic-bezier(0.5482,0.1148,0.3669,1); transform: matrix(1.072,0,0,1.072,0,0); } 19.7% { animation-timing-function: cubic-bezier(0.5603,0,0.3766,1); transform: matrix(0.838,0,0,0.838,0,0); } 30% { animation-timing-function: cubic-bezier(0.4325,0.1566,0.4986,1); transform: matrix(1.04,0,0,1.04,0,0); } 39.7% { animation-timing-function: cubic-bezier(0.4946,0,0.465,1); transform: matrix(0.906,0,0,0.906,0,0); } 50% { animation-timing-function: cubic-bezier(0.441,0,0.5348,1); transform: matrix(1.023,0,0,1.023,0,0); } 59.6% { animation-timing-function: cubic-bezier(0.4163,0,0.5607,1); transform: matrix(0.947,0,0,0.947,0,0); } 69.9% { animation-timing-function: cubic-bezier(0.3695,0,0.6226,1); transform: matrix(1.012,0,0,1.012,0,0); } 79.3% { animation-timing-function: cubic-bezier(0.3487,0,0.643,1); transform: matrix(0.976,0,0,0.976,0,0); } 89.6% { animation-timing-function: cubic-bezier(0.3369,0,0.6548,1); transform: matrix(1.004,0,0,1.004,0,0); } 96.6% { animation-timing-function: cubic-bezier(0.3474,0,0.6732,1); transform: matrix(0.998,0,0,0.998,0,0); } 100% { transform: matrix(1,0,0,1,0,0); } }</style>"""

