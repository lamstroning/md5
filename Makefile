NAME = ft_ssl

COMPILE = gcc
CFLAGS = -Wall -Werror -Wextra

SRC_LIST = main.c

SRC_DIR = ./src/
OBJ_DIR = ./obj/

SRC = $(addprefix $(SRC_DIR), $(SRC_LIST))
OBJ = $(addprefix $(OBJ_DIR), $(SRC_LIST:.c=.o))

LIB_DIR = ./libft
LIN_INC = 
LIB = -L $(LIB_DIR) -lft

INC_LIB = -I $(LIB_DIR)
INC = -I ./inc

all: obj $(NAME) success

success:
	@echo "$(NAME) was compiled successfully!"
clean_success:
	@echo "clean success!"

obj:
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o:$(SRC_DIR)%.c
	$(COMPILE) $(CFLAGS) $(INC) $(INC_LIB) -o $@ -c $<

$(NAME): $(OBJ)
	@make -s -C $(LIB_DIR)
	@gcc $(CFLAGS) $(SRC) $(LIB) $(INC_LIB) -o $(NAME)

clean: clean_success
	@make -s -C $(LIB_DIR) clean
	@rm -rf $(OBJ_DIR)

fclean: clean
	@make -s -C $(LIB_DIR) fclean
	@rm -rf $(NAME)

re: fclean all
