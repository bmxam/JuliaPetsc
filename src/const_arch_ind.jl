# define common PETSc constants, independant from PETSC_ARCH
# -> directly copied from https://github.com/JuliaParallel/PETSc.jl.git

const PetscErrorCode = Cint

"""
    Macro to automatically export all items of an enum
"""
macro exported_enum(name, args...)
    esc(quote
        @enum($name, $(args...))
        export $name
        $([:(export $arg) for arg in args]...)
    end)
end


@enum PetscBool PETSC_FALSE PETSC_TRUE

@enum PetscDataType begin
    PETSC_DATATYPE_UNKNOWN = 0
    PETSC_DOUBLE = 1
    PETSC_COMPLEX = 2
    PETSC_LONG = 3
    PETSC_SHORT = 4
    PETSC_FLOAT = 5
    PETSC_CHAR = 6
    PETSC_BIT_LOGICAL = 7
    PETSC_ENUM = 8
    PETSC_BOOL = 9
    PETSC_FLOAT128 = 10
    PETSC_OBJECT = 11
    PETSC_FUNCTION = 12
    PETSC_STRING = 13
    PETSC___FP16 = 14
    PETSC_STRUCT = 15
    PETSC_INT = 16
    PETSC_INT64 = 17
end

const Petsc64bitInt = Int64
const PetscLogDouble = Cdouble

@enum InsertMode begin
    NOT_SET_VALUE
    INSERT_VALUES
    ADD_VALUES
    MAX_VALUES
    MIN_VALUES
    INSERT_ALL_VALUES
    ADD_ALL_VALUES
    INSERT_BC_VALUES
    ADD_BC_VALUES
end

@enum NormType begin
    NORM_1 = 0
    NORM_2 = 1
    NORM_FROBENIUS = 2
    NORM_INFINITY = 3
    NORM_1_AND_2 = 4
end

@enum MatAssemblyType begin
    MAT_FLUSH_ASSEMBLY = 1
    MAT_FINAL_ASSEMBLY = 0
end

@enum MatFactorType begin
    MAT_FACTOR_NONE = 0
    MAT_FACTOR_LU = 1
    MAT_FACTOR_CHOLESKY = 2
    MAT_FACTOR_ILU = 3
    MAT_FACTOR_ICC = 4
    MAT_FACTOR_ILUDT = 5
end

@enum MatOption begin
    MAT_OPTION_MIN = -3
    MAT_UNUSED_NONZERO_LOCATION_ERR = -2
    MAT_ROW_ORIENTED = -1
    MAT_SYMMETRIC = 1
    MAT_STRUCTURALLY_SYMMETRIC = 2
    MAT_FORCE_DIAGONAL_ENTRIES = 3
    MAT_IGNORE_OFF_PROC_ENTRIES = 4
    MAT_USE_HASH_TABLE = 5
    MAT_KEEP_NONZERO_PATTERN = 6
    MAT_IGNORE_ZERO_ENTRIES = 7
    MAT_USE_INODES = 8
    MAT_HERMITIAN = 9
    MAT_SYMMETRY_ETERNAL = 10
    MAT_NEW_NONZERO_LOCATION_ERR = 11
    MAT_IGNORE_LOWER_TRIANGULAR = 12
    MAT_ERROR_LOWER_TRIANGULAR = 13
    MAT_GETROW_UPPERTRIANGULAR = 14
    MAT_SPD = 15
    MAT_NO_OFF_PROC_ZERO_ROWS = 16
    MAT_NO_OFF_PROC_ENTRIES = 17
    MAT_NEW_NONZERO_LOCATIONS = 18
    MAT_NEW_NONZERO_ALLOCATION_ERR = 19
    MAT_SUBSET_OFF_PROC_ENTRIES = 20
    MAT_SUBMAT_SINGLEIS = 21
    MAT_STRUCTURE_ONLY = 22
    MAT_SORTED_FULL = 23
    MAT_FORM_EXPLICIT_TRANSPOSE = 24
    MAT_OPTION_MAX = 25
end

@enum PetscViewerFormat begin
    PETSC_VIEWER_DEFAULT
    PETSC_VIEWER_ASCII_MATLAB
    PETSC_VIEWER_ASCII_MATHEMATICA
    PETSC_VIEWER_ASCII_IMPL
    PETSC_VIEWER_ASCII_INFO
    PETSC_VIEWER_ASCII_INFO_DETAIL
    PETSC_VIEWER_ASCII_COMMON
    PETSC_VIEWER_ASCII_SYMMODU
    PETSC_VIEWER_ASCII_INDEX
    PETSC_VIEWER_ASCII_DENSE
    PETSC_VIEWER_ASCII_MATRIXMARKET
    PETSC_VIEWER_ASCII_VTK
    PETSC_VIEWER_ASCII_VTK_CELL
    PETSC_VIEWER_ASCII_VTK_COORDS
    PETSC_VIEWER_ASCII_PCICE
    PETSC_VIEWER_ASCII_PYTHON
    PETSC_VIEWER_ASCII_FACTOR_INFO
    PETSC_VIEWER_ASCII_LATEX
    PETSC_VIEWER_ASCII_XML
    PETSC_VIEWER_ASCII_GLVIS
    PETSC_VIEWER_ASCII_CSV
    PETSC_VIEWER_DRAW_BASIC
    PETSC_VIEWER_DRAW_LG
    PETSC_VIEWER_DRAW_LG_XRANGE
    PETSC_VIEWER_DRAW_CONTOUR
    PETSC_VIEWER_DRAW_PORTS
    PETSC_VIEWER_VTK_VTS
    PETSC_VIEWER_VTK_VTR
    PETSC_VIEWER_VTK_VTU
    PETSC_VIEWER_BINARY_MATLAB
    PETSC_VIEWER_NATIVE
    PETSC_VIEWER_HDF5_PETSC
    PETSC_VIEWER_HDF5_VIZ
    PETSC_VIEWER_HDF5_XDMF
    PETSC_VIEWER_HDF5_MAT
    PETSC_VIEWER_NOFORMAT
    PETSC_VIEWER_LOAD_BALANCE
end

@enum PetscFileMode begin
    FILE_MODE_UNDEFINED = -1
    FILE_MODE_READ = 0
    FILE_MODE_WRITE
    FILE_MODE_APPEND
    FILE_MODE_UPDATE
    FILE_MODE_APPEND_UPDATE
end

@enum MatOperation begin
    MATOP_SET_VALUES = 0
    MATOP_GET_ROW = 1
    MATOP_RESTORE_ROW = 2
    MATOP_MULT = 3
    MATOP_MULT_ADD = 4
    MATOP_MULT_TRANSPOSE = 5
    MATOP_MULT_TRANSPOSE_ADD = 6
    MATOP_SOLVE = 7
    MATOP_SOLVE_ADD = 8
    MATOP_SOLVE_TRANSPOSE = 9
    MATOP_SOLVE_TRANSPOSE_ADD = 10
end

@enum ScatterMode begin
    SCATTER_FORWARD = 0
    SCATTER_REVERSE = 1
    SCATTER_FORWARD_LOCAL = 2
    SCATTER_REVERSE_LOCAL = 3
    # SCATTER_LOCAL = 2 # not supported
end