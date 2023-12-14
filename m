Return-Path: <linux-doc+bounces-5120-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5614813865
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 18:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738E528311F
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 17:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0333265EB5;
	Thu, 14 Dec 2023 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1qRQLnb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54883B2;
	Thu, 14 Dec 2023 09:22:59 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7b783ee485eso83421039f.0;
        Thu, 14 Dec 2023 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574578; x=1703179378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn1zaC13xrpZ8HR3VlWdFsy2rSn+JRCW3L/spRmkW0E=;
        b=W1qRQLnbZZqsXo+QL9/6qkIJxvbGuJ82kLl+ztb3tmcTEOHrjYV3M248nRdIe12Euo
         kSSVRsIJwrEGSrO4nDqIBhduiC8zX7jdxlUMW98U/UAkh2FI7Tab7zQ3+uHEO5jklUT4
         eZyD8qE2QtBtu0cxNPb1RQTx6zMLyonvLUh7l1ltuyGR8xsuW/3TnG5HUoMqiMGcps8/
         bcu96oii50p78+A/4kAQ0CoT0kpT3m6s6po1DRFFnzGYO+3NtoiswTum8TRQ09ONzwYK
         vivGmyiKZknt4m/y/5yZqMoxaqv8npwVa55gbDAR+8KK+bxWlNIIHpICD+t6lLubgwOw
         BlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574578; x=1703179378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn1zaC13xrpZ8HR3VlWdFsy2rSn+JRCW3L/spRmkW0E=;
        b=B3NSQy4llMj7sScnPfYdauw1kydI1iq2Fp5wgFES+LvsdW0EqZ+8fyL9E7FurAzxNN
         rbFyncSb1k3mJ/Rx/vDbP2BS1NcmkJdLFQTYOM2B4SVJLG15nSdMrQO9/5hhtSnc6fwd
         KvXOMOJGbZ3WAHuMXJIz7bSe8KBXato23PqZS22QPyt7AzQDBuH9nc45TX5GQrChUI8v
         MSr13JI9MvHWTesPlRGd5LLV+MmIpu9gJoVR1AZo2kdWsBaZAeLA5tgGwUHk2wLUmT7e
         voi8cjGt4eCXAuzGbglgGRDH5WYtP79gZlJXIGarjm/LUWPhUK4ZBKtHwTivn1qWjt9g
         p3jw==
X-Gm-Message-State: AOJu0YzNPLGkb1SH0lLXvv5ENXk7bvr1woV6hN+jFHolQA0VqemPYNTP
	9h/YSVlCEQhdzN9NgkS5rI1bXlMp/ynCtN+DYbM=
X-Google-Smtp-Source: AGHT+IHe0dQgEg56O3SWkZjdq4Lbk1qqWohc1sV9GUplbadPeS3xUWvg7nOuatLXfVK570X0NwJ97ndHttKFRoH8U9k=
X-Received: by 2002:a92:c261:0:b0:35f:7d16:c92d with SMTP id
 h1-20020a92c261000000b0035f7d16c92dmr1572035ild.44.1702574578529; Thu, 14 Dec
 2023 09:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
 <1c03eb18-a6ac-45c8-8fea-46097bb4e132@gmail.com>
In-Reply-To: <1c03eb18-a6ac-45c8-8fea-46097bb4e132@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Dec 2023 18:22:47 +0100
Message-ID: <CANiq72=mvca8PXoxwzSao+QFbAHDCecSKCDtV+ffd+YgZNFaww@mail.gmail.com>
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to
 build directory
To: Tiago Lam <tiagolam@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vincent Guittot <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 2:26=E2=80=AFPM Tiago Lam <tiagolam@gmail.com> wrot=
e:
>
> `scripts/min-tool-version.sh` won't exist within the build dir if the
> option the user takes is "enter the kernel build directory", right? It
> only works if they use the `--path` argument in the `rustup override
> set` option.

Yeah, the script is in the source tree, and the path is the build
tree. Giving a single one-liner with `--path <builddir>` and
`<srctree>/scripts...` would be simplest in the sense that it would
allow us to remove even the "enter ..." part too. But then the command
cannot be copy-pasted and it is likely harder for newcomers that may
not be using `O=3D`.

Something like v1 but a bit simpler, e.g. keeping things as they are,
but with just a sentence after the command like "If you are building
the kernel with `O=3D`, i.e. specifying an output directory, then you
should append `--path <builddir>`." could work.

Or we could just provide a `rustupoverride` Make target to do this for
us [1], since we have all the information needed and would be
copy-pasteable by everybody. I can send it as a non-mangled patch and
then Viresh can redo this one on top using it.

Cheers,
Miguel

[1]

diff --git a/Makefile b/Makefile
index 70fc4c11dfc0..7fe82dd4dc6f 100644
--- a/Makefile
+++ b/Makefile
@@ -276,7 +276,8 @@ no-dot-config-targets :=3D $(clean-targets) \
                         cscope gtags TAGS tags help% %docs check% cocciche=
ck \
                         $(version_h) headers headers_% archheaders
archscripts \
                         %asm-generic kernelversion %src-pkg dt_binding_che=
ck \
-                        outputmakefile rustavailable rustfmt rustfmtcheck
+                        outputmakefile rustavailable rustfmt rustfmtcheck =
\
+                        rustupoverride
 no-sync-config-targets :=3D $(no-dot-config-targets) %install
modules_sign kernelrelease \
                          image_name
 single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s
%.symtypes %/
@@ -1611,6 +1612,7 @@ help:
        @echo  '                    (requires kernel .config;
downloads external repos)'
        @echo  '  rust-analyzer   - Generate rust-project.json
rust-analyzer support file'
        @echo  '                    (requires kernel .config)'
+       @echo  '  rustupoverride  - Set up a rustup override for the
build directory'
        @echo  '  dir/file.[os]   - Build specified target only'
        @echo  '  dir/file.rsi    - Build macro expanded source,
similar to C preprocessing.'
        @echo  '                    Run with RUSTFMT=3Dn to skip
reformatting if needed.'
@@ -1735,6 +1737,11 @@ rustfmt:
 rustfmtcheck: rustfmt_flags =3D --check
 rustfmtcheck: rustfmt

+# `rustup override` setup target
+PHONY +=3D rustupoverride
+rustupoverride:
+       $(Q)rustup override set $(shell
$(srctree)/scripts/min-tool-version.sh rustc)
+
 # Misc
 # ------------------------------------------------------------------------=
---

