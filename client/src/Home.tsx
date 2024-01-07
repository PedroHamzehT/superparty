import Logo from './assets/images/superparty-logo.png'
import HomeForm from './components/HomeForm'

function App() {
  return (
    <>
      <div className='flex flex-col justify-center items-center mt-5 mx-8'>
        <img src={Logo} alt="" className='w-32 h-32 mb-5'/>

        <h1 className='text-3xl font-bold'>Organize all your parties in one place</h1>
        <h2 className='text-xl'>Birthdays, trips with friends, barbecues, meetups, all you can imagine</h2>

        <HomeForm />
      </div>
    </>
  )
}

export default App
