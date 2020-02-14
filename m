Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3696A15F3C7
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2020 19:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404476AbgBNSPJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Feb 2020 13:15:09 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33681 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404455AbgBNSPJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 13:15:09 -0500
Received: by mail-il1-f195.google.com with SMTP id s18so8829607iln.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xaqocqI7n6rLhfdsAfsTQaAIhwnxm1qjzL1SYx1WFE=;
        b=hj1rflza0N0ahI/+Gib5Me4e1hJXe20b4t9CabubbAWx1ea4PGEDoBKz1g/sTDSHVh
         BkrKDWptx3Iw26vTATPAmfUJDeuVBDraF8++mKvznG20mbE6Pice1TDSOeV6+MqN3YEb
         3nbpfkMNy8ZmiUOCpbFFVmtuXK1tpbmsYgTLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xaqocqI7n6rLhfdsAfsTQaAIhwnxm1qjzL1SYx1WFE=;
        b=NKVYZk3Qazr+sj6ZRVeUHMrleX99benk5rLXfiwVcu2vDMbRoDofwpy0TrdTrJFdNk
         vfHv8zgIXWw63FEAYk1IgUoio+J3gUOS7Qc0E1ZQ+tUXoTyZemMN6m0KkzU15TWcu0MQ
         oC2laYblC/SBkmQnyFvrvoF3A067Py2rP5o2DFFZbuZafj0RLmUcmOSNgD5+IoD8WoW9
         QY3Ho3k+arpvHRIaLI7x0wlLj/kGYPGseekMBo3vAQFwU+WJ1Lgv9SBgmgofrycfjuKN
         A1dFNNIA1/7RbukMaPv9c09oCIwp12TK17UTca5qV07tBXTBVinp48TvVKUo0flo5lto
         89bg==
X-Gm-Message-State: APjAAAWD9SXu/BhBS6+CUAGBguLL2zTZci719TDbOxPduv6+rV7rlZKj
        DbpzGHnRm6IjLL5mIuiNIYaFx2UoJ4uOnwPMNIzXZA==
X-Google-Smtp-Source: APXvYqyfILAtOIqub0HXb6q5FysHf639kfwZQi9NKsp0iDgHRaBKzXR2uoGVpx/vHgvyqNQMw/PayKSHtXU1wqjJCF8=
X-Received: by 2002:a92:af8e:: with SMTP id v14mr4049827ill.150.1581704108241;
 Fri, 14 Feb 2020 10:15:08 -0800 (PST)
MIME-Version: 1.0
References: <158166060044.9887.549561499483343724.stgit@devnote2> <158166062748.9887.15284887096084339722.stgit@devnote2>
In-Reply-To: <158166062748.9887.15284887096084339722.stgit@devnote2>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Sat, 15 Feb 2020 02:14:42 +0800
Message-ID: <CAJMQK-hZAgCPjgdRE70QrkSKvJAgYPwmCHB9pjLUn3tQ6p_2YA@mail.gmail.com>
Subject: Re: [PATCH 2/3] random: rng-seed source is utf-8
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, kernel-team@android.com,
        Mark Salyzyn <salyzyn@android.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Juergen Gross <jgross@suse.com>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 14, 2020 at 2:10 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> From: Mark Salyzyn <salyzyn@android.com>
>
> commit 428826f5358c922dc378830a1717b682c0823160
> ("fdt: add support for rng-seed") makes the assumption that the data
> in rng-seed is binary, when it is typically constructed of utf-8
> characters which has a bitness of roughly 6 to give appropriate
> credit due for the entropy.
>
> Fixes: 428826f5358c ("fdt: add support for rng-seed")
> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Theodore Y. Ts'o <tytso@mit.edu>
> ---
>  drivers/char/random.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index c7f9584de2c8..ee21a6a584b1 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -2306,7 +2306,7 @@ EXPORT_SYMBOL_GPL(add_hwgenerator_randomness);
>  void add_bootloader_randomness(const void *buf, unsigned int size)
>  {
>         if (IS_ENABLED(CONFIG_RANDOM_TRUST_BOOTLOADER))
> -               add_hwgenerator_randomness(buf, size, size * 8);
> +               add_hwgenerator_randomness(buf, size, size * 6);
Hi,

In the next patch, entropy is added by
+                       add_device_randomness(rng_seed, strlen(rng_seed));
+                       credit_trusted_entropy_bits(strlen(rng_seed) * 6);

If the add_bootloader_randomness() function is only used for dt, do we
need to shorten the credit bits?

In dt-schema[1] we stated that this is a uint8 array, and dt is able
to generate this. It doesn't need to avoid using space for parameter
splitting.

For some device, asking for random number is time consuming. Shorten
the credit length makes it have to generate longer seed for dt to meet
the CRNG_INIT_CNT_THRESH threshold.

[1] https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.yaml#L55

Thanks
