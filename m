Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA15E3B0
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2019 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfD2N0F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Apr 2019 09:26:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40569 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfD2N0F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Apr 2019 09:26:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id u17so1351311pfn.7
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2019 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WU22o7ORRjAB6LcBsaDZgsJPZQTLBbgaDyibEx6Izj4=;
        b=P6UnyeM18IjOYI0uqwvG04cgNFEmIzGkn8Zx1CTaM3EU2VBNd8Sq+F66l1Iqel1Yni
         vydGFNKZ0TZ4ytr/FKur1zgYvH8yy2ZLGnucmwPM8n59AVERNvvZowq1ZZxi7OmWOgbB
         WcBzcncpcf1QJ/NpRyujm7q4CcM04r49DY7mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WU22o7ORRjAB6LcBsaDZgsJPZQTLBbgaDyibEx6Izj4=;
        b=jIOHiWmafXYRUZwCua3GxoCzjrad1ExSTpBgjU8nrZmBzW3+twDCp95qeZuvPBzN2w
         o6TrGVyW7QK8WhsFHs+nbr+xXPEcjpfF3fyVg3s+ETh21MqGEh4DHOqqmZuPCMQ7QmXJ
         NpRzNLvoxMKS0nqQ1J5syJ8s/8hCwnOMhQ9WZVhWU3aSFjX42Uwl7UGj53QRViMLe0dh
         I2ZUAwfO9XoAlQnTodtVZikUrj0bM15rm7NXX2OZ3c6ksR/yRhwF3nAXuixkEIVgHGWj
         lDXwW0nKYw6lU74lSxYzAhx9iVJWTyjfhKa84RFKN/FLxGBm6v5J9SpaViRzf/D+EP9o
         9WaA==
X-Gm-Message-State: APjAAAWThHY+gqi4ed1CZokfRCv9hvS2HdxBx22cjijJHz9uEz1/Hn6b
        3r95QYOC6Lof4pH25Wye7YjZdQ==
X-Google-Smtp-Source: APXvYqx9UzLdYVWzhDG3VMDqK4tBUafQVA8CqNZMrTqqjMP7rqs3ju5rsldug7i+iqfW0HNWdyj5Sw==
X-Received: by 2002:a63:5041:: with SMTP id q1mr36002644pgl.386.1556544364696;
        Mon, 29 Apr 2019 06:26:04 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id 10sm98275989pft.100.2019.04.29.06.26.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 06:26:03 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:26:02 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>, mhiramat@kernel.org,
        qais.yousef@arm.com, rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>, yhs@fb.com,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
Message-ID: <20190429132602.GA165075@google.com>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190427133844.GA29366@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 27, 2019 at 03:38:44PM +0200, Greg KH wrote:
> On Fri, Apr 26, 2019 at 03:04:29PM -0400, Joel Fernandes (Google) wrote:
> > Introduce in-kernel headers which are made available as an archive
> > through proc (/proc/kheaders.tar.xz file). This archive makes it
> > possible to run eBPF and other tracing programs that need to extend the
> > kernel for tracing purposes without any dependency on the file system
> > having headers.
> > 
> > A github PR is sent for the corresponding BCC patch at:
> > https://github.com/iovisor/bcc/pull/2312
> > 
> > On Android and embedded systems, it is common to switch kernels but not
> > have kernel headers available on the file system. Further once a
> > different kernel is booted, any headers stored on the file system will
> > no longer be useful. This is an issue even well known to distros.
> > By storing the headers as a compressed archive within the kernel, we can
> > avoid these issues that have been a hindrance for a long time.
> > 
> > The best way to use this feature is by building it in. Several users
> > have a need for this, when they switch debug kernels, they do not want to
> > update the filesystem or worry about it where to store the headers on
> > it. However, the feature is also buildable as a module in case the user
> > desires it not being part of the kernel image. This makes it possible to
> > load and unload the headers from memory on demand. A tracing program can
> > load the module, do its operations, and then unload the module to save
> > kernel memory. The total memory needed is 3.3MB.
> > 
> > By having the archive available at a fixed location independent of
> > filesystem dependencies and conventions, all debugging tools can
> > directly refer to the fixed location for the archive, without concerning
> > with where the headers on a typical filesystem which significantly
> > simplifies tooling that needs kernel headers.
> > 
> > The code to read the headers is based on /proc/config.gz code and uses
> > the same technique to embed the headers.
> > 
> > Other approaches were discussed such as having an in-memory mountable
> > filesystem, but that has drawbacks such as requiring an in-kernel xz
> > decompressor which we don't have today, and requiring usage of 42 MB of
> > kernel memory to host the decompressed headers at anytime. Also this
> > approach is simpler than such approaches.
> > 
> > Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for the Reviewed-by tag. I believe there are still 2 logistical things
to merge this.
1. Location of the header archive:
Olof and Steve did not like it to be in /proc and instead /sys seemed a better
choice they are Ok with. Me and Greg were Ok with it being in /sys/kernel/.
Alexei, Greg and me are Ok with either proc or Sys.

2. Who is going to pull this patch: This seems a matter of where the header
archive resides. If it is in /sys/kernel/ then I am assuming Greg will pull
it.  Masahiro has given his Reviewed-by tag, is he the one to pull it?

Let us agree on these open questions so I can respin the patch to be based on
that and move this forward.

thanks!

 - Joel

