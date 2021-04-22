"""
    This package has been inspired and even sometimes directly copied from two projects:
    - https://github.com/gridap/GridapPETSc.jl
    - https://github.com/JuliaParallel/PETSc.jl

    I have decided to remove all exclamation marks `!` at the end of routines "modifying" their arguments
    when the name is the same as in PETSc API. It was too confusing.
"""
module PetscWrap

using Libdl
using MPI

include("const_arch_ind.jl")
export  PetscErrorCode, PETSC_DECIDE
# export all items of some enums
for item in Iterators.flatten((instances(InsertMode), instances(MatAssemblyType), instances(PetscViewerFormat)))
    @eval export $(Symbol(item))
end

include("load.jl")

include("const_arch_dep.jl")
export PetscReal, PetscScalar, PetscInt, PetscIntOne

include("init.jl")
export PetscInitialize, PetscFinalize

include("viewer.jl")
export  PetscViewer, CViewer,
        PetscViewerASCIIOpen,
        PetscViewerCreate,
        PetscViewerDestroy,
        PetscViewerPopFormat,
        PetscViewerPushFormat,
        PetscViewerStdWorld

include("vec.jl")
export  PetscVec, CVec,
        VecAssemble,
        VecAssemblyBegin,
        VecAssemblyEnd,
        VecCreate,
        VecDestroy,
        VecDuplicate,
        VecGetArray,
        VecGetLocalSize,
        VecGetOwnershipRange,
        VecGetSize,
        VecRestoreArray,
        VecSetFromOptions,
        VecSetSizes,
        VecSetUp,
        VecSetValue,
        VecSetValues,
        VecView

include("mat.jl")
export  PetscMat, CMat,
        MatAssemble,
        MatAssemblyBegin,
        MatAssemblyEnd,
        MatCreate,
        MatCreate,
        MatCreateVecs,
        MatDestroy,
        MatGetOwnershipRange,
        MatSetFromOptions,
        MatSetSizes,
        MatSetUp,
        MatSetValues,
        MatView

include("ksp.jl")
export  PetscKSP, CKSP,
        KSPCreate,
        KSPDestroy,
        KSPSetFromOptions,
        KSPSetOperators,
        KSPSetUp,
        KSPSolve

# fancy
include("fancy/vec.jl")
export  assemble!,
        create_vector,
        destroy!,
        duplicate,
        get_range,
        set_local_size!, set_global_size!,
        set_from_options!,
        set_up!,
        vec2array

include("fancy/mat.jl")
export  create_matrix

include("fancy/ksp.jl")
export  create_ksp,
        solve, solve!,
        set_operators!

end