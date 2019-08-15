Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 530F58F147
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2019 18:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfHOQyl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Aug 2019 12:54:41 -0400
Received: from foss.arm.com ([217.140.110.172]:46702 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728128AbfHOQyl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Aug 2019 12:54:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35078360;
        Thu, 15 Aug 2019 09:54:40 -0700 (PDT)
Received: from [10.1.194.48] (e123572-lin.cambridge.arm.com [10.1.194.48])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C14B3F706;
        Thu, 15 Aug 2019 09:54:38 -0700 (PDT)
Subject: Re: [PATCH v8 4/5] arm64: Define
 Documentation/arm64/tagged-address-abi.rst
To:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>,
        Dave P Martin <Dave.Martin@arm.com>,
        Dave Hansen <dave.hansen@intel.com>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org
References: <20190815154403.16473-1-catalin.marinas@arm.com>
 <20190815154403.16473-5-catalin.marinas@arm.com>
From:   Kevin Brodsky <kevin.brodsky@arm.com>
Message-ID: <c06f4c55-6bbc-c589-a42f-c37e44955002@arm.com>
Date:   Thu, 15 Aug 2019 17:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815154403.16473-5-catalin.marinas@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 15/08/2019 16:44, Catalin Marinas wrote:
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> On AArch64 the TCR_EL1.TBI0 bit is set by default, allowing userspace
> (EL0) to perform memory accesses through 64-bit pointers with a non-zero
> top byte. Introduce the document describing the relaxation of the
> syscall ABI that allows userspace to pass certain tagged pointers to
> kernel syscalls.
>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Co-developed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>   Documentation/arm64/tagged-address-abi.rst | 155 +++++++++++++++++++++
>   1 file changed, 155 insertions(+)
>   create mode 100644 Documentation/arm64/tagged-address-abi.rst
>
> diff --git a/Documentation/arm64/tagged-address-abi.rst b/Documentation/arm64/tagged-address-abi.rst
> new file mode 100644
> index 000000000000..8808337775d6
> --- /dev/null
> +++ b/Documentation/arm64/tagged-address-abi.rst
> @@ -0,0 +1,155 @@
> +==========================
> +AArch64 TAGGED ADDRESS ABI
> +==========================
> +
> +Authors: Vincenzo Frascino <vincenzo.frascino@arm.com>
> +         Catalin Marinas <catalin.marinas@arm.com>
> +
> +Date: 15 August 2019
> +
> +This document describes the usage and semantics of the Tagged Address
> +ABI on AArch64 Linux.
> +
> +1. Introduction
> +---------------
> +
> +On AArch64 the TCR_EL1.TBI0 bit is set by default, allowing userspace
> +(EL0) to perform memory accesses through 64-bit pointers with a non-zero
> +top byte. This document describes the relaxation of the syscall ABI that
> +allows userspace to pass certain tagged pointers to kernel syscalls.
> +
> +2. AArch64 Tagged Address ABI
> +-----------------------------
> +
> +From the kernel syscall interface perspective and for the purposes of
> +this document, a "valid tagged pointer" is a pointer with a potentially
> +non-zero top-byte that references an address in the user process address
> +space obtained in one of the following ways:
> +
> +- mmap() done by the process itself (or its parent), where either:

The "parent" aspect is a useful addition, but technically, the mapping may have been 
established by any process indirectly forked from the current process, not just its 
immediate parent. I wonder if there is a better way to formulate this, to avoid this 
complication. Maybe simply "mmap() syscall" (syscalls are always made from userspace, 
and any mapping requested by userspace is eligible here)?

> +
> +  - flags have the **MAP_ANONYMOUS** bit set
> +  - the file descriptor refers to a regular file (including those
> +    returned by memfd_create()) or **/dev/zero**
> +
> +- brk() system call done by the process itself (i.e. the heap area

Same idea.

> +  between the initial location of the program break at process creation
> +  and its current location).
> +
> +- any memory mapped by the kernel in the address space of the process
> +  during creation and with the same restrictions as for mmap() above
> +  (e.g. data, bss, stack).
> +
> +The AArch64 Tagged Address ABI has two stages of relaxation depending
> +how the user addresses are used by the kernel:
> +
> +1. User addresses not accessed by the kernel but used for address space
> +   management (e.g. mmap(), mprotect(), madvise()). The use of valid
> +   tagged pointers in this context is always allowed.
> +
> +2. User addresses accessed by the kernel (e.g. write()). This ABI
> +   relaxation is disabled by default and the application thread needs to
> +   explicitly enable it via **prctl()** as follows:
> +
> +   - **PR_SET_TAGGED_ADDR_CTRL**: enable or disable the AArch64 Tagged
> +     Address ABI for the calling thread.
> +
> +     The (unsigned int) arg2 argument is a bit mask describing the
> +     control mode used:
> +
> +     - **PR_TAGGED_ADDR_ENABLE**: enable AArch64 Tagged Address ABI.
> +       Default status is disabled.
> +
> +     Arguments arg3, arg4, and arg5 must be 0.
> +
> +   - **PR_GET_TAGGED_ADDR_CTRL**: get the status of the AArch64 Tagged
> +     Address ABI for the calling thread.
> +
> +     Arguments arg2, arg3, arg4, and arg5 must be 0.
> +
> +   The ABI properties described above are thread-scoped, inherited on
> +   clone() and fork() and cleared on exec().
> +
> +   Calling prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0)
> +   returns -EINVAL if the AArch64 Tagged Address ABI is globally disabled
> +   by sysctl abi.tagged_addr_disabled=1. The default sysctl
> +   abi.tagged_addr_disabled configuration is 0.
> +
> +When the AArch64 Tagged Address ABI is enabled for a thread, the
> +following behaviours are guaranteed:
> +
> +- All syscalls except the cases mentioned in section 3 can accept any
> +  valid tagged pointer.
> +
> +- The syscall behaviour is undefined for invalid tagged pointers: it may
> +  result in an error code being returned, a (fatal) signal being raised,
> +  or other modes of failure.
> +
> +- A valid tagged pointer has the same semantics as the corresponding
> +  untagged pointer.
> +
> +A definition of the meaning of tagged pointers on AArch64 can be found
> +in Documentation/arm64/tagged-pointers.rst.
> +
> +3. AArch64 Tagged Address ABI Exceptions
> +-----------------------------------------
> +
> +The following system call parameters must be untagged regardless of the
> +ABI relaxation:
> +
> +- prctl() other than arguments pointing to user structures to be
> +  accessed by the kernel.
> +
> +- ioctl() other than arguments pointing to user structures to be
> +  accessed by the kernel.

Isn't "user structures" too restrictive? For instance, PR_SET_NAME takes a char *, 
and there's no reason not allow it to be tagged. Maybe a more generic "user data"? 
There is the additional issue of user struct's containing pointers, I guess the 
restriction should apply recursively...

Otherwise, the ABI looks pretty good to me, especially the new address space 
management / user data distinction.

Kevin

> +
> +- shmat() and shmdt().
> +
> +Any attempt to use non-zero tagged pointers may result in an error code
> +being returned, a (fatal) signal being raised, or other modes of
> +failure.
> +
> +4. Example of correct usage
> +---------------------------
> +.. code-block:: c
> +
> +   #include <stdlib.h>
> +   #include <string.h>
> +   #include <unistd.h>
> +   #include <sys/mman.h>
> +   #include <sys/prctl.h>
> +
> +   #define PR_SET_TAGGED_ADDR_CTRL	55
> +   #define PR_TAGGED_ADDR_ENABLE	(1UL << 0)
> +
> +   #define TAG_SHIFT		56
> +
> +   int main(void)
> +   {
> +   	int tbi_enabled = 0;
> +   	unsigned long tag = 0;
> +   	char *ptr;
> +
> +   	/* check/enable the tagged address ABI */
> +   	if (!prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0))
> +   		tbi_enabled = 1;
> +
> +   	/* memory allocation */
> +   	ptr = mmap(NULL, sysconf(_SC_PAGE_SIZE), PROT_READ | PROT_WRITE,
> +   		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +   	if (ptr == MAP_FAILED)
> +   		return 1;
> +
> +   	/* set a non-zero tag if the ABI is available */
> +   	if (tbi_enabled)
> +   		tag = rand() & 0xff;
> +   	ptr = (char *)((unsigned long)ptr | (tag << TAG_SHIFT));
> +
> +   	/* memory access to a tagged address */
> +   	strcpy(ptr, "tagged pointer\n");
> +
> +   	/* syscall with a tagged pointer */
> +   	write(1, ptr, strlen(ptr));
> +
> +   	return 0;
> +   }

