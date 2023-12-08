Return-Path: <linux-doc+bounces-4513-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893080A39E
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 13:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D7E1F213E2
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 12:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8CF101C6;
	Fri,  8 Dec 2023 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eS9gYmn5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158221710
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 04:43:28 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so2352707e87.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 04:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702039406; x=1702644206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4jRq8coAm6Zi8gGKP+BNqEZe9vdeBRNYUjT809qI8k=;
        b=eS9gYmn5WmiONKtxW1pUrNsiHvsUa8Bak0Cw08bWY+D+a4TVi05QHvNOyNS1UKgsQP
         XLAMSBLK99Bx5bk55gh3dnocWnl9OmJOy2/s9awqWVW/hPMySHxjjk+UNmLWCEZq3b7d
         bPVXC+w/9NSfIm3YxSXfJO50/RzsB7hLaxAbfWBcnTRyHfP/NbwMqjk+s0eumO2Vdlpq
         GBat9vfuhklrDpgBo/doNWtE0UidlEHxyQdF6h+5KfuBnuZQaPY/5l1IWNWmxKpNu/BU
         FYEtXZsK/CaaoWoj1yGw+y2lSZNAnLIDoJ53EIJ33JrwiYXXrS317U7Q2n16Gb3R6lUD
         KvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039406; x=1702644206;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4jRq8coAm6Zi8gGKP+BNqEZe9vdeBRNYUjT809qI8k=;
        b=w9MR4jlGgJ18Rk1bpkz852V2AlQCEiGSm6HqTyYWr6fdwxA9jq4fpE+qRPmbIamZGw
         FUmzyL9eKvFWQT5MllEKjEsmUlmcYlnqmVcV6aJnhk2SO14Zw+fMEvCqvoAmb//fCXp1
         jub24HWjRWOVHyXIdnu0pE0eR/slBvJyXNNhnVXUdb/1V4cfnIAXcXMt6BQdNVUZtFcJ
         Di3Bn2Z4u6SyN94TGEfl3Chi62iSlwKuHOWKC7mBv8jAzTi3LDZBAUHjVCOoked1ECNg
         2TmpNG12mx03WVBFC6aWOv1TSppB3VDc/TfwidU2B7Bv8YI2P9ddRHP+pgipZTyZk//e
         JhPA==
X-Gm-Message-State: AOJu0YxlOb8kUJR8WOzUIc2Wc4iVmlh+p1ub0IbCz5ZgSBeHkWGDenGw
	cbcO9+jZ+/PknnhkD3wnjO1EEg==
X-Google-Smtp-Source: AGHT+IHRFOAuPIdICwCcvqg1kT1FUQi84zSfoyRSVJAtC+mFNnvreKg04Zjw+t+pELN5DB8vfxXdEQ==
X-Received: by 2002:a05:6512:3b0f:b0:50b:f3cc:13b0 with SMTP id f15-20020a0565123b0f00b0050bf3cc13b0mr1610669lfv.62.1702039406308;
        Fri, 08 Dec 2023 04:43:26 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ec44-20020a0564020d6c00b0054dc00457e3sm770302edb.5.2023.12.08.04.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:43:25 -0800 (PST)
Date: Fri, 8 Dec 2023 13:43:24 +0100
From: Petr Mladek <pmladek@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Joe Lawrence <joe.lawrence@redhat.com>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v3 2/3] livepatch: Move tests from lib/livepatch to
 selftests/livepatch
Message-ID: <ZXL_Lmx9J8U25fq-@alley>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2312080854100.14729@pobox.suse.cz>

On Fri 2023-12-08 09:06:30, Miroslav Benes wrote:
> > > My idea is to abandon this way completely, take the selftests and build 
> > > and run them on the system right away.
> > > 
> > > Both should be doable, hopefully, if we wire it all correctly... and 
> > > document it.
> > > 
> > I can't think of why it shouldn't continue to work, even in a future
> > where newer livepatching selftests support older kernels.  (We would
> > just have newer selftests sources backported to test older kernel sources.)
> > 
> > Are there any test cases which truly need to be build on-the-fly?  Aside
> > from testing different toolchain pieces?
> 
> https://github.com/SUSE/qa_test_klp is what we would like to migrate to 
> selftests to have just one place for all tests.
> 
> There is basically just one live patch template and one supporting kernel 
> module template which is livepatched. The final result is driven by a set 
> of macros and function parameters. In some cases more modules are compiled 
> as parts of a test in a loop.
>
> However, I do not think there is anything which truly needs to be built 
> on-the-fly in the end. Everything can be worked around. Templates may be 
> abandoned and we would have a live patch and a module(s) per test. Some 
> tests are probably not worth it and may be removed. So it is a question of 
> convenience and maintainability. When we, for example, simplified API and 
> klp_register_patch() was removed, only one place needed to be amended. 
> Also, the current state in lib/livepatch/ could be simplified with the 
> proposed infrastructure as some files could be merged together.

In the patchset reworking livepatch states, I solved this problem
by including the same sources in another module source, like:

$> cat lib/livepatch/test_klp_speaker_livepatch2.c
// SPDX-License-Identifier: GPL-2.0
// Copyright (C) 2023 SUSE

/* Same livepatch with the same features. */
#include "test_klp_speaker_livepatch.c"

=========

$> cat lib/livepatch/test_klp_speaker2.c
// SPDX-License-Identifier: GPL-2.0
// Copyright (C) 2023 SUSE

/* Use versioned function name for livepatched functions */
#define _VER_NAME(name) name ## 2

/* Same module with the same features. */
#include "test_klp_speaker.c"

==========

And the behavior was changed by module parameters. The test
lookes like:

$> cat tools/testing/selftests/livepatch/test-modules.sh
[...]
start_test "multiple target modules"

load_mod $MOD_TARGET
read_module_param $MOD_TARGET welcome

load_lp $MOD_LIVEPATCH add_applause=1
read_module_param $MOD_TARGET welcome

load_mod $MOD_TARGET2
read_module_param $MOD_TARGET2 welcome

unload_mod $MOD_TARGET2
disable_lp $MOD_LIVEPATCH
read_module_param $MOD_TARGET welcome

unload_lp $MOD_LIVEPATCH
unload_mod $MOD_TARGET

===========

It is a kind of hack. But it would allow to build and package the
test modules. It has several advantages:

   + Less modules are needed. The behavior is modified by
     the parameters.

   + The separate parameters are easier to parse in compare
     with embedding the behavior into the module name.

   + Build problems would be solved before the packages
     reach QA department

   + The package would have lightweight dependencies.

   + Running the tests would be faster.



Regarding disadvantages:

   + The source included in all the other variants would be more
     complex.

     But the same would happen when building the modules during
     the tests. It would also require a more complicated template
     and an extra script generating the particular module sources.


I personally prefer the solution with "#include" because it has
all the mentioned advantages. The "#include" is a hack but it is
needed only when we need more modules with all the features.

Best Regards,
Petr

