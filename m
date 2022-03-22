Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCB64E4669
	for <lists+linux-doc@lfdr.de>; Tue, 22 Mar 2022 20:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiCVTDw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Mar 2022 15:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiCVTDv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 15:03:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC5B8E193;
        Tue, 22 Mar 2022 12:02:22 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qa43so38137750ejc.12;
        Tue, 22 Mar 2022 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/jS0hERR3ksXmbYQvcJyNUIxDDGatTI257+NkZyyX7k=;
        b=FJ7B+wZpGYGXIgaX7iGrzKRgJbXP4fpv5Rx/JQE/sAAklh0zBDI89VtN3UGYWPWUJ8
         k4TIVh4GIo9BMg/VJSsOe4NqNQKyuV+G+7kuzI6J697d4yl2XqoXB5EiSXwvkVzqN9hP
         2QY3xgIhrKeaeQ8C7Dmzxq+lAU1QRXgmcyx8MbJnlkgm95p+dk88aXEUTDVWe+Oj8KxB
         TQYhk9U0DXMpMcJ9ppZ3XD6h666t+78f6SqdO9mHJEU16CslfdUkeokYjRV3FAM3nSb4
         mBxZyGreh4Z2NLiic1JiGC+kKQ6JB3KY4Au0zCvpO1Snad6zX0SsIRUmJBEi2Cne2yf7
         QANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/jS0hERR3ksXmbYQvcJyNUIxDDGatTI257+NkZyyX7k=;
        b=TWrBWR13Rpz4vsXVIh5eKu7auhNwnW8nktPTLFfTNUvhQXsy+0sTc0uGeuuA0xuJOm
         HsIaC6tmGW6BuLQ6/OX6asIxr7tz0XNkm2hMnBOdzenQVWVqEk2QyQELMq8Sp/kbAc8T
         ea0nUldi2fNhX9XyqC6QJsBfbi45wWHJIFIly46RQ0dh+tRKjrd7atoJdjBA+rxN4AFR
         LtyXEYuUAZHu2P6MyaB/tWVgOsvv2rOyCJ9miPXsOdtaNUyGDEE1w3tZsLUO2g9JR6/h
         rNYtAk6WO4sIHnrDvwxLBxH2U+NTiS/sjXkDZno4k5kZypqxiMZuxPHrkdf+0tNQwSCk
         Rgyg==
X-Gm-Message-State: AOAM530FOTIbNsguMCbW/PxRXWbDrFogc9CKCOWDm95Ns7Lc/tDsgT9k
        ouSKdgjCuVOxq73KiHGLLkE=
X-Google-Smtp-Source: ABdhPJyVPPO1gvnXo6z/Ae9tV4h4rd1RD17mYpQm2CmOtp8XshdvcFh4PanI98BN3KvaQa/HFmPmyA==
X-Received: by 2002:a17:906:a046:b0:6b9:20c:47c1 with SMTP id bg6-20020a170906a04600b006b9020c47c1mr26995361ejb.615.1647975740653;
        Tue, 22 Mar 2022 12:02:20 -0700 (PDT)
Received: from pswork ([62.96.250.75])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906c00900b006d4a45869basm8614678ejz.199.2022.03.22.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 12:02:20 -0700 (PDT)
Date:   Tue, 22 Mar 2022 20:02:19 +0100
From:   Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/3] bootconfig: Support embedding a bootconfig file
 in kernel
Message-ID: <20220322190219.GA26859@pswork>
References: <164724890153.731226.1478494969800777757.stgit@devnote2>
 <164724892075.731226.14103557516176115189.stgit@devnote2>
 <20220316191649.GA11547@pswork>
 <20220318101445.fdb151efe58c6c3a1c572500@kernel.org>
 <20220321183500.GA4065@pswork>
 <20220322120311.690f237b63ddfd9c0e4f78ec@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322120311.690f237b63ddfd9c0e4f78ec@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Masami Hiramatsu,

On Tue, Mar 22, 2022 at 12:03:11PM +0900, Masami Hiramatsu wrote:
> On Mon, 21 Mar 2022 19:35:00 +0100
> Padmanabha Srinivasaiah <treasure4paddy@gmail.com> wrote:
> 
> > Hello Masami Hiramatsu,
> > 
> > On Fri, Mar 18, 2022 at 10:14:45AM +0900, Masami Hiramatsu wrote:
> > > On Wed, 16 Mar 2022 20:16:49 +0100
> > > Padmanabha Srinivasaiah <treasure4paddy@gmail.com> wrote:
> > > 
> > > > Hello Masami Hiramatsu,
> > > > 
> > > > On Mon, Mar 14, 2022 at 06:08:41PM +0900, Masami Hiramatsu wrote:
> > > > > This allows kernel developer to embed a default bootconfig file in
> > > > > the kernel instead of embedding it in the initrd. This will be good
> > > > > for who are using the kernel without initrd, or who needs a default
> > > > > bootconfigs.
> > > > > This needs to set two kconfigs: CONFIG_EMBED_BOOT_CONFIG=y and set
> > > > > the file path to CONFIG_EMBED_BOOT_CONFIG_FILE.
> > > > > 
> > > > > Note that you still need 'bootconfig' command line option to load the
> > > > > embedded bootconfig. Also if you boot using an initrd with a different
> > > > > bootconfig, the kernel will use the bootconfig in the initrd, instead
> > > > > of the default bootconfig.
> > > > > 
> > > > > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > > > > ---
> > > > >  include/linux/bootconfig.h |   10 ++++++++++
> > > > >  init/Kconfig               |   21 +++++++++++++++++++++
> > > > >  init/main.c                |   13 ++++++++-----
> > > > >  lib/.gitignore             |    1 +
> > > > >  lib/Makefile               |   12 ++++++++++++
> > > > >  lib/bootconfig.c           |   23 +++++++++++++++++++++++
> > > > >  6 files changed, 75 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
> > > > > index a4665c7ab07c..5dbda5e3e9bb 100644
> > > > > --- a/include/linux/bootconfig.h
> > > > > +++ b/include/linux/bootconfig.h
> > > > > @@ -289,4 +289,14 @@ int __init xbc_get_info(int *node_size, size_t *data_size);
> > > > >  /* XBC cleanup data structures */
> > > > >  void __init xbc_exit(void);
> > > > >  
> > > > > +/* XBC embedded bootconfig data in kernel */
> > > > > +#ifdef CONFIG_EMBED_BOOT_CONFIG
> > > > > +char * __init xbc_get_embedded_bootconfig(size_t *size);
> > > > > +#else
> > > > > +static inline char *xbc_get_embedded_bootconfig(size_t *size)
> > > > > +{
> > > > > +	return NULL;
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >  #endif
> > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > index e9119bf54b1f..70440804874d 100644
> > > > > --- a/init/Kconfig
> > > > > +++ b/init/Kconfig
> > > > > @@ -1357,6 +1357,27 @@ config BOOT_CONFIG
> > > > >  
> > > > >  	  If unsure, say Y.
> > > > >  
> > > > > +config EMBED_BOOT_CONFIG
> > > > > +	bool "Embed bootconfig file in the kernel"
> > > > > +	depends on BOOT_CONFIG
> > > > > +	default n
> > > > > +	help
> > > > > +	  Embed a bootconfig file given by EMBED_BOOT_CONFIG_FILE in the
> > > > > +	  kernel. Usually, the bootconfig file is loaded with the initrd
> > > > > +	  image. But if the system doesn't support initrd, this option will
> > > > > +	  help you by embedding a bootconfig file while building the kernel.
> > > > > +
> > > > > +	  If unsure, say N.
> > > > > +
> > > > > +config EMBED_BOOT_CONFIG_FILE
> > > > > +	string "Embedded bootconfig file path"
> > > > > +	default ""
> > > > > +	depends on EMBED_BOOT_CONFIG
> > > > > +	help
> > > > > +	  Specify a bootconfig file which will be embedded to the kernel.
> > > > > +	  This bootconfig will be used if there is no initrd or no other
> > > > > +	  bootconfig in the initrd.
> > > > > +
> > > > >  choice
> > > > >  	prompt "Compiler optimization level"
> > > > >  	default CC_OPTIMIZE_FOR_PERFORMANCE
> > > > > diff --git a/init/main.c b/init/main.c
> > > > > index 421050be5039..3803bf2e22ea 100644
> > > > > --- a/init/main.c
> > > > > +++ b/init/main.c
> > > > > @@ -265,7 +265,7 @@ static int __init loglevel(char *str)
> > > > >  early_param("loglevel", loglevel);
> > > > >  
> > > > >  #ifdef CONFIG_BLK_DEV_INITRD
> > > > > -static void * __init get_boot_config_from_initrd(u32 *_size)
> > > > > +static void * __init get_boot_config_from_initrd(size_t *_size)
> > > > >  {
> > > > >  	u32 size, csum;
> > > > >  	char *data;
> > > > > @@ -411,12 +411,15 @@ static void __init setup_boot_config(void)
> > > > >  	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
> > > > >  	const char *msg;
> > > > >  	int pos;
> > > > > -	u32 size;
> > > > > +	size_t size;
> > > > >  	char *data, *err;
> > > > >  	int ret;
> > > > >  
> > > > >  	/* Cut out the bootconfig data even if we have no bootconfig option */
> > > > >  	data = get_boot_config_from_initrd(&size);
> > > > > +	/* If there is no bootconfig in initrd, try embedded one. */
> > > > > +	if (!data)
> > > > > +		data = xbc_get_embedded_bootconfig(&size);
> > > > >  
> > > > >  	strlcpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> > > > >  	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
> > > > > @@ -435,8 +438,8 @@ static void __init setup_boot_config(void)
> > > > >  	}
> > > > >  
> > > > >  	if (size >= XBC_DATA_MAX) {
> > > > > -		pr_err("bootconfig size %d greater than max size %d\n",
> > > > > -			size, XBC_DATA_MAX);
> > > > > +		pr_err("bootconfig size %ld greater than max size %d\n",
> > > > > +			(long)size, XBC_DATA_MAX);
> > > > >  		return;
> > > > >  	}
> > > > >  
> > > > > @@ -449,7 +452,7 @@ static void __init setup_boot_config(void)
> > > > >  				msg, pos);
> > > > >  	} else {
> > > > >  		xbc_get_info(&ret, NULL);
> > > > > -		pr_info("Load bootconfig: %d bytes %d nodes\n", size, ret);
> > > > > +		pr_info("Load bootconfig: %ld bytes %d nodes\n", (long)size, ret);
> > > > >  		/* keys starting with "kernel." are passed via cmdline */
> > > > >  		extra_command_line = xbc_make_cmdline("kernel");
> > > > >  		/* Also, "init." keys are init arguments */
> > > > > diff --git a/lib/.gitignore b/lib/.gitignore
> > > > > index e5e217b8307b..30a2a5db7033 100644
> > > > > --- a/lib/.gitignore
> > > > > +++ b/lib/.gitignore
> > > > > @@ -6,3 +6,4 @@
> > > > >  /oid_registry_data.c
> > > > >  /test_fortify.log
> > > > >  /test_fortify/*.log
> > > > > +/default.bconf
> > > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > > index 300f569c626b..8183785ee99d 100644
> > > > > --- a/lib/Makefile
> > > > > +++ b/lib/Makefile
> > > > > @@ -279,6 +279,18 @@ $(foreach file, $(libfdt_files), \
> > > > >  	$(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
> > > > >  lib-$(CONFIG_LIBFDT) += $(libfdt_files)
> > > > >  
> > > > > +ifeq ($(CONFIG_EMBED_BOOT_CONFIG),y)
> > > > > +# Since the specified bootconfig file can be switched, we forcibly update the
> > > > > +# default.bconf file always.
> > > > > +$(obj)/default.bconf: FORCE
> > > > > +	$(call cmd,defbconf)
> > > > > +
> > > > > +quiet_cmd_defbconf = GEN     $@
> > > > > +      cmd_defbconf = cat < /dev/null $(CONFIG_EMBED_BOOT_CONFIG_FILE) > $@
> > > > > +clean-files	+= default.bconf
> > > > > +$(obj)/bootconfig.o: $(obj)/default.bconf
> > > > > +endif
> > > > > +
> > > > >  lib-$(CONFIG_BOOT_CONFIG) += bootconfig.o
> > > > >  
> > > > >  obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
> > > > > diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> > > > > index 74f3201ab8e5..3a3bf3a208e3 100644
> > > > > --- a/lib/bootconfig.c
> > > > > +++ b/lib/bootconfig.c
> > > > > @@ -12,6 +12,29 @@
> > > > >  #include <linux/kernel.h>
> > > > >  #include <linux/memblock.h>
> > > > >  #include <linux/string.h>
> > > > > +
> > > > > +#ifdef CONFIG_EMBED_BOOT_CONFIG
> > > > > +asm (
> > > > > +"	.pushsection .init.data, \"aw\"			\n"
> > > > > +"	.global embedded_bootconfig_data		\n"
> > > > > +"embedded_bootconfig_data:				\n"
> > > > > +"	.incbin \"lib/default.bconf\"			\n"
> > > > > +"	.global embedded_bootconfig_data_end		\n"
> > > > > +"embedded_bootconfig_data_end:				\n"
> > > > > +"	.popsection					\n"
> > > > > +);
> > > > > +
> > > > > +extern __visible char embedded_bootconfig_data[];
> > > > > +extern __visible char embedded_bootconfig_data_end[];
> > > > > +
> > > > > +char * __init xbc_get_embedded_bootconfig(size_t *size)
> > > > > +{
> > > > > +	*size = embedded_bootconfig_data_end - embedded_bootconfig_data;
> > > > > +	return (*size) ? embedded_bootconfig_data : NULL;
> > > > > +}
> > > > > +
> > > > > +#endif
> > > > > +
> > > > >  #else /* !__KERNEL__ */
> > > > >  /*
> > > > >   * NOTE: This is only for tools/bootconfig, because tools/bootconfig will
> > > > >
> > > > 
> > > > Thanks tested the implemation, it works as expected.
> > > 
> > > Great!
> > > 
> > > > 
> > > > Also noted that a change in default.bconf requries a clean build, is it
> > > > expected behaviour?
> > > 
> > > default.bconf will be always updated if CONFIG_EMBED_BOOT_CONFIG=y. So you can
> > > do incremental build. (I tested it with the incremental build environment)
> > >
> > 
> > Thanks, your observation made me to further experiment ther incremental build.
> > 
> > Below are the observations I have:
> > 
> > When I use GCC for a build; yes, the modified default.conf was observed on
> > the target.
> > 
> > But when I use clang; either with FULL or THIN LTO, the modified
> > default.conf doesnt get reflected on the target.
> 
> Hmm, curious. So you just add 'CC=clang' on the make command line, right?
Yes, CC=clang ARCH=arm64 LLVM=1. As specified here:
https://docs.kernel.org/kbuild/llvm.html.

> Can you confirm that following line in your build log,
> 
>   GEN     lib/default.bconf
>
Yes, I do see above line. Indeed lib/default.bconf will get incremental
change.

  GEN     lib/default.bconf
  CC      lib/bootconfig.o
  AR      lib/lib.a

> and the timestamp of lib/bootconfig.o is built after lib/default.bconf file?
> 
Yes, verified timestamp for all above artifacts including vmlinux.o.

ex:
-rw-rw-r-- 1 psrinivasaia psrinivasaia 22K Mar 22 14:50
../out/lib/bootconfig.o
-rw-rw-r-- 1 psrinivasaia psrinivasaia 355 Mar 22 14:50
../out/lib/default.bconf
-rw-rw-r-- 1 psrinivasaia psrinivasaia 54M Mar 22 14:50 ../out/vmlinux.o

As said incremnetal change was refelected in artifact default.bconf.
But not in vmlinux.o/vmlinux, used below command to verify.

llvm-objdump  -s -j .init.data ../out/vmlinux

On target too, /proc/bootconfig shows old data.

> And is that related to CONFIG_LTO? What happen if CONFIG_LTO=n?
> 
Yes;  CONFIG_LTO_NONE=y  issue not observed even with LLVM binutils.

Thanks and Regards,
Padmanabha.S
> Thank you,
> 
> > 
> > PS: Using: GCC version 8.2.1 20180802, LLVM version 13.0.2git.
> > 
> > Thank you,
> > Padmanabha.S
> > > Thank you,
> > > 
> > > > 
> > > > Thanks and Regards,
> > > > Padmanabha.S
> > > 
> > > 
> > > -- 
> > > Masami Hiramatsu <mhiramat@kernel.org>
> 
> 
> -- 
> Masami Hiramatsu <mhiramat@kernel.org>
