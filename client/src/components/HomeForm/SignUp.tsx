import useHomeContext from "./useHomeContext"
import ActionButtons from "./ActionButtons"

const SignUp = () => {
  const { formState, handleFormChange, handleSubmit } = useHomeContext()

  return (
    <form className="mt-5" onSubmit={handleSubmit}>
      <div className='grid grid-cols-2 gap-4'>
        <input name="name" onChange={handleFormChange} value={formState.name} type="text" placeholder='Type your name' className='border border-gray-300 p-2 rounded-md'/>
        <input name="email" onChange={handleFormChange} value={formState.email} type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input name="password" onChange={handleFormChange} value={formState.password} type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
        <input name="confirm_password" onChange={handleFormChange} value={formState.confirm_password} type="password" placeholder='Confirm your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className="flex justify-end">
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign up</button>
      </div>

      <ActionButtons currentType={formState.sign_type} />
    </form>
  );
}

export default SignUp
