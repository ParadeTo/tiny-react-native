import React from 'react'
import {View} from './react-native'
import {useEffect, useState, useRef} from 'react'

const W = 100
const innerW = 50

function useUpdate() {
  const [_, _update] = useState()
  return () => _update(Math.random())
}

function App() {
  const x = useRef(0)
  const y = useRef(0)
  const update = useUpdate()
  const animate = () => {
    setTimeout(() => {
      if (y.current === 0 && x.current < W - innerW) {
        x.current += 1
      } else if (x.current >= W - innerW && y.current < W - innerW) {
        y.current += 1
      } else if (y.current >= W - innerW && x.current > 0) {
        x.current -= 1
      } else {
        y.current -= 1
      }
      update()
      animate()
    }, 50)
  }
  useEffect(() => {
    animate()
  }, [])
  return (
    <View x={50} y={50} w={W} h={W} r={255} g={0} b={0} a={1}>
      <View
        x={x.current}
        y={y.current}
        w={innerW}
        h={innerW}
        r={0}
        g={255}
        b={0}
        a={1}></View>
    </View>
  )
}

export default App
