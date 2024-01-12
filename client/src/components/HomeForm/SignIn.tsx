import useHomeContext from "./useHomeContext"
import ActionButtons from "./ActionButtons"

const SignIn = () => {
  const { formState, handleFormChange, handleSubmit } = useHomeContext()

  return (
    <form className="mt-5" onSubmit={handleSubmit}>
      <div className='grid grid-cols-2 gap-4'>
        <input name="email" value={formState.email} onChange={handleFormChange} type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input name="password" value={formState.password} onChange={handleFormChange} type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className="flex justify-end">
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign in</button>
      </div>

      <ActionButtons currentType={formState.sign_type} />
    </form>
  )
}

export default SignIn
