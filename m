Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B392136C1
	for <lists+linux-doc@lfdr.de>; Sat,  4 May 2019 02:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfEDA7X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 May 2019 20:59:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36715 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfEDA7X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 May 2019 20:59:23 -0400
Received: by mail-pg1-f195.google.com with SMTP id 85so3525558pgc.3
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2019 17:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yvz1h3uWXxpTkOnnU/TKaBDR2WAc1nuALwyWB7QLiTo=;
        b=YvyFgbpuBemeeHnrSn+PdX7AyZ4vOEFKZO+dOgh3izhAOTRnS/K74laZpqfhSO+LpS
         Jx2poX6BhBhW9SFpGW5jyP2vj1YNk9NOUD3ecYlTttLd7e32AtIIcx+W9+yl3DNVESyB
         wXKGnUBGYX5aiU9l09tLqw3DXTe5q1/D+TbFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yvz1h3uWXxpTkOnnU/TKaBDR2WAc1nuALwyWB7QLiTo=;
        b=oKh/2PTXln4qge8Ko00169p6uKexIF9G0sfjfmuvBHPYcdnTsXTAQlc+1/uMMJiHlR
         wtmtORKUDiK2fGKyXu0Arr6zIfSRdNB6kiRnGu/VKNQJ0OEf9sFy8Oed5r+YkG0g/k41
         CENfH30+NS4kBcsIbZRuXBtyWs/E1s7/oLktnSdMGjgXHpUPPeAsRqm8HZn1mcMZu2jW
         7wzDOduZtwkn1jeA5N3FfAJ/x+TgQcWOrmZriVM0dUQFqmshJ0G3EQJumRHZApual3DO
         NmyUug3gQjLP1K2lHOxnS+IuVcJQpCJQpRBLAcadmZPcdnXb7EP53YHQCWZtDdqUVnpD
         6bHQ==
X-Gm-Message-State: APjAAAX7NYYGBzVZnxp3qDl05NNE+2xfYAcIr6qL5JPrfko7d0P7sA52
        OM/Tzf8Ds8ZHuPkCnubkJrIGJA==
X-Google-Smtp-Source: APXvYqzU0FF3sN/XGW7SSYo9TzXqrKS0wyl4DSiB+gjPutQPkAxOrFppUNq0o5ssZ1n2oIesTG4UKQ==
X-Received: by 2002:a62:70c6:: with SMTP id l189mr15362930pfc.139.1556931562728;
        Fri, 03 May 2019 17:59:22 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a3sm4163407pfn.182.2019.05.03.17.59.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 17:59:21 -0700 (PDT)
Date:   Fri, 3 May 2019 20:59:20 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        atish patra <atishp04@gmail.com>, bpf@vger.kernel.org,
        Brendan Gregg <bgregg@netflix.com>,
        Brendan Gregg <brendan.d.gregg@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        duyuchao <yuchao.du@unisoc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manjo Raja Rao <linux@manojrajarao.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        =?utf-8?Q?Micha=C5=82?= Gregorczyk <michalgr@fb.com>,
        Michal Gregorczyk <michalgr@live.com>,
        Mohammad Husain <russoue@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Tamir Carmeli <carmeli.tamir@gmail.com>,
        Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH] kheaders: Move from proc to sysfs
Message-ID: <20190504005920.GA261146@google.com>
References: <20190503182459.159121-1-joel@joelfernandes.org>
 <CAK7LNATRTqh_OJcQaWfcYYYqyZ-c0u1prD17LDYwDh18z2V31Q@mail.gmail.com>
 <CAK7LNASkR7cauvcLprgrTKNv-iY4yjS278FPGJ-UEYTBrANKYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASkR7cauvcLprgrTKNv-iY4yjS278FPGJ-UEYTBrANKYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 04, 2019 at 09:21:41AM +0900, Masahiro Yamada wrote:
> On Sat, May 4, 2019 at 9:18 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, May 4, 2019 at 3:27 AM Joel Fernandes (Google)
> > <joel@joelfernandes.org> wrote:
> > >
> > > The kheaders archive consisting of the kernel headers used for compiling
> > > bpf programs is in /proc. However there is concern that moving it here
> > > will make it permanent. Let us move it to /sys/kernel as discussed [1].
> > >
> > > [1] https://lore.kernel.org/patchwork/patch/1067310/#1265969
> > >
> > > Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > ---
> > > This patch applies on top of the previous patch that was applied to the
> > > driver tree:
> > > https://lore.kernel.org/patchwork/patch/1067310/
> > >
> > >  kernel/kheaders.c | 40 ++++++++++++++++------------------------
> >
> >
> > Please rename CONFIG_IKHEADERS_PROC.
> >
> > Thanks.
> 
> 
> Please adjust Kconfig prompt.
>   tristate "Enable kernel header artifacts through /proc/kheaders.tar.xz"
> 
> 
> "depends on PROC_FS"  ->  "depends on SYSFS"

Sorry to miss these config updates. I will update the patch and resend.

