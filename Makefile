# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gabrodri <gabrodri@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 09:38:38 by gabrodri          #+#    #+#              #
#    Updated: 2023/11/08 09:44:37 by gabrodri         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME	= get_next_line.a
CFLAGS	= -Wall -Werror -Wextra -I. -c

# Libft folder
#LIBFT_DIR   = libft

# Mandatory part
PART	= get_next_line.c \
		get_next_line_utils.c

OBJ		= $(PART:.c=.o)

# Bonus part
BONUS   = get_next_line_bonus.c \
		get_next_line_utils_bonus.c
OBJ_BONUS = $(BONUS:.c=.o)

# Rules
all: $(NAME)

$(NAME): $(OBJ)
	@echo "------------------------------------"
	@echo "Compiling get_next_line Mandatory Part"
	@echo "------------------------------------"
	ar rcs $(NAME) $(OBJ)

bonus: $(OBJ_BONUS)
	@echo "------------------------------------"
	@echo "Compiling get_next_line Bonus Part"
	@echo "------------------------------------"
	ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)

# Add a target to run tests using the test.sh script
test: all
	sh ./tests/test.sh

clean:
	@echo "------------------------------------"
	@echo "Cleaning the object files"
	@echo "------------------------------------"
	rm -f $(OBJ)

fclean: clean
	@echo "------------------------------------"
	@echo "Cleaning the object files and the libraries"
	@echo "------------------------------------"
	rm -f $(NAME)

re: fclean all

# .PHONY targets for clean, fclean, all, and re for better Makefile behavior
.PHONY: clean fclean all re
