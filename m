Return-Path: <linux-doc+bounces-6665-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416582AF4A
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jan 2024 14:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8424282FA3
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jan 2024 13:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9268A171B2;
	Thu, 11 Jan 2024 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UTZd9lDa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360716403
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28b2e1a13fso563542166b.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 05:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704978863; x=1705583663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCNCVeMrlWJxf5qX+E5fJGrbwnZ87NzyDtVjQyYpgQk=;
        b=UTZd9lDafTlUTQtNY6vQS/PQVO9sDK+3DpFc++J83gZ+R2H515eoPglREqAYxvqTna
         HkMoIQI3TzyOob/RqNDNsgusv9WFsEjKaR+4jNlGzPvwInOnn2aEMBcFC3uV/PIxlneY
         A6xzWOHB3oqdDD+pjZrpodZs7L1TJOH4M9NZAy/L89qSESAt24znxuAC31ApRNwF51Wo
         OYBsc+FVsHWfx973FShGgNR0gRTL4SJ9srabe4bD9MhjAfozu16nDGyo6NwHBVC+UW2F
         dQODLnXuUOSUhZjelytJNSK+dtVtIeXb9GRBgxRBECReTHLf1XB56mq/j/K7d9e3eTia
         1d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978863; x=1705583663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCNCVeMrlWJxf5qX+E5fJGrbwnZ87NzyDtVjQyYpgQk=;
        b=ZeCCqZ3E76+XWBTLB/0PLTMbUfULNbyr11EN3dEAsyWJsxtttv586PN0agurHt0e79
         uh+gcL9aPrnfnzP3TiVmmRCvbkuFM3aHTwZQTnHq9M6akC09B59NIZho9vmT8g/eW2w8
         ImhxNWgtpv33c/Hbz2IYmLo5bzTm9KOUT4VnKaFstE5M+loj2bLKxJEpl/+5W2EfUSNe
         qvrSt5YByb7iALQvhWs/+xfsGsEJ3BOLdP6PL07yjPEzpC/40mLUmZMKhhmB79PrmjiU
         VaNp08jnoNv4GbpdO2hZoDqWDML4nRrtlnlNShKspu0xS7k5xqSgIL67oD45DS1PpQNg
         Le3w==
X-Gm-Message-State: AOJu0YyXlfGfAoIoXpPVTrYLrOD54hbf2GoGzs+226sGKgex6R8XBc9c
	/4ULfTm3nouS+ggBGgDzA77a8wYUnis1vpztDSqmU22ImQo=
X-Google-Smtp-Source: AGHT+IGBVw22W2OzEoJmEk9Elwj9ma9Il/3v/LVT8XzL3+C0bm8CX5rIyMF55d9KmXgQCByhP0JI3g==
X-Received: by 2002:a17:906:6a05:b0:a28:ac84:5d52 with SMTP id qw5-20020a1709066a0500b00a28ac845d52mr782286ejc.2.1704978863223;
        Thu, 11 Jan 2024 05:14:23 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id u3-20020a1709064ac300b00a269b4692a9sm568895ejt.84.2024.01.11.05.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:14:23 -0800 (PST)
Date: Thu, 11 Jan 2024 14:14:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	live-patching@vger.kernel.org
Subject: Re: [PATCH v5 1/3] kselftests: lib.mk: Add TEST_GEN_MODS_DIR variable
Message-ID: <ZZ_phoS29aNXplC2@alley>
References: <20240109-send-lp-kselftests-v5-0-364d59a69f12@suse.com>
 <20240109-send-lp-kselftests-v5-1-364d59a69f12@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109-send-lp-kselftests-v5-1-364d59a69f12@suse.com>

On Tue 2024-01-09 21:24:54, Marcos Paulo de Souza wrote:
> Add TEST_GEN_MODS_DIR variable for kselftests. It can point to
> a directory containing kernel modules that will be used by
> selftest scripts.
> 
> The modules are built as external modules for the running kernel.
> As a result they are always binary compatible and the same tests
> can be used for older or newer kernels.
> 
> The build requires "kernel-devel" package to be installed.
> For example, in the upstream sources, the rpm devel package
> is produced by "make rpm-pkg"
> 
> The modules can be built independently by
> 
>   make -C tools/testing/selftests/livepatch/
> 
> or they will be automatically built before running the tests via
> 
>   make -C tools/testing/selftests/livepatch/ run_tests
> 
> Note that they are _not_ built when running the standalone
> tests by calling, for example, ./test-state.sh.
> 
> Along with TEST_GEN_MODS_DIR, it was necessary to create a new install
> rule. INSTALL_MODS_RULE is needed because INSTALL_SINGLE_RULE would
> copy the entire TEST_GEN_MODS_DIR directory to the destination, even
> the files created by Kbuild to compile the modules. The new install
> rule copies only the .ko files, as we would expect the gen_tar to work.
> 
> Reviewed-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

I am not export on kbuild. But it looks reasonable and works for me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


