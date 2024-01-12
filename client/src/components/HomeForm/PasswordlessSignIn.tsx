import ActionButtons from "./ActionButtons"
import useHomeContext from "./useHomeContext"

const PasswordlessSignIn = () => {
  const { formState, handleFormChange, handleSubmit } = useHomeContext()

  return (
    <form className="mt-5" onSubmit={handleSubmit}>
      <div className='flex justifiy-center'>
        <input name="email" value={formState.email} onChange={handleFormChange} type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className="flex justify-end">
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Continue</button>
      </div>

      <ActionButtons currentType={formState.sign_type} />
    </form>
  )
}

export default PasswordlessSignIn
