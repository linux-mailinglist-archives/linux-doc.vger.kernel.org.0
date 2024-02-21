Return-Path: <linux-doc+bounces-10330-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A985EB7E
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 23:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1812C283F1F
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 22:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1726C128378;
	Wed, 21 Feb 2024 22:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bpj48WmF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857EC127B68
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552873; cv=none; b=gHeDqdwJfVJmpMwL3jqOpQN1xVqWL8o085wuhD56w0ruQU2tmL7d45hM2J5zFxwXDzbhO7s2Kl7tG6MnZkKMhxBBZ4as5i2WQsNQQho3NI0NUvxRJuOXA88MFJNIyVRdRl0dFE1LoFvrIT64van86UxO+OGIqdJHcO59In7Yk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552873; c=relaxed/simple;
	bh=wqGWw9nOiid78rmVoNJpLAKogw9OxxtIINANjebVuns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3wqefXznFRvEyC+d0LhWgpbxe29T6yWwHs5ZfIiuViy4k7soe4+wwbb9PZIBQqImqpA92wE0Z/P4dZyokvlVhZCnkhGSnqFp3KJibtabhXXzE8elKJLctZG93cu78DryiMC/l3hCQ6xaWzk69BxDn/oMT+C9/2AHsTCbgt2+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bpj48WmF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d918008b99so59918745ad.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 14:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708552871; x=1709157671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+6LHH2NPUzYokJHyaMeg6P0BHjKGeB4TbkarefmniY=;
        b=bpj48WmFS/Iv/Pl0hg7lOS8zJgnv0NSStFCNmbJ6KEpuG46kTUN/691glGTo/3Ussp
         p+NO4+VI9TFFxK1I1IpwAumuQPpNmQosA0O5VcsIoRgOfll/Zs90O7tq42+7asod3qYo
         QfauMBovnb/+K04a39tMMdP5sPWShkQq8NrPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552871; x=1709157671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+6LHH2NPUzYokJHyaMeg6P0BHjKGeB4TbkarefmniY=;
        b=QQWjMUaYpsXqFzpm37G+WzpYN367my7LmdCulnB3vybEMHaGz813UYyaW2oMEfj7V1
         7yO7JqZo763rwUQAm959JW3R8aacEPK4VTcHT5sOxqIfLEFGSBwlgITiyAloqNSmlLa9
         8QJOsIuFS+iT+QBzCR78S94CwAI4MamCGKBFRNULLeHEJHErE3QMrD+Nvy/nSwg7LZMk
         gYgQO79eWOc7R2GleQeAuf33UGOQjtuRVJp8mX4nrLIFaXWj/zxqbAUXlE07iqzYxwzc
         ZjiFd1cmpEzF0+PF+VNPe44Ftk23OpT/ii0VxOtTGzkrx7lsmse2hy0cFGSBVRuR7nHu
         2EDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbctAGHRrj05l9tMTT48P7xBHxkEQBeFuEtMURcq/QSXrKMClljyz9Wo2rSfeIWrYJ65FYpnVMuZ7pCzviCiuO06C7HrScXCgD
X-Gm-Message-State: AOJu0Yz+i9x17IBF7obkJJGRTriNAGonMRTnedgAdFbeZMSqMi6+lIb8
	jxqSnSNYKzvNFL3BZwz/Y35bkRF2YCdRmdkGQddKiiKuuS7U1MoG37FUeqttpQ==
X-Google-Smtp-Source: AGHT+IEf5eKUQSWm+opFfaiF5eBQJmg0AXhYyA+h2y9jNbW7sOQuiyq0AM8mKQQVx25bJ6R/7Y4UCw==
X-Received: by 2002:a17:902:f70f:b0:1dc:4b04:13d4 with SMTP id h15-20020a170902f70f00b001dc4b0413d4mr60269plo.8.1708552870628;
        Wed, 21 Feb 2024 14:01:10 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902e90400b001dbba4c8289sm8533989pld.202.2024.02.21.14.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 14:01:10 -0800 (PST)
Date: Wed, 21 Feb 2024 14:01:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Haowen Bai <baihaowen@meizu.com>, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yonghong Song <yonghong.song@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>,
	Anton Protopopov <aspsk@isovalent.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] bpf: Replace bpf_lpm_trie_key 0-length array with
 flexible array
Message-ID: <202402211347.2AF2EC4621@keescook>
References: <20240220185421.it.949-kees@kernel.org>
 <da75b2bf-0d14-6ed5-91c2-dfeba9ad55c4@iogearbox.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da75b2bf-0d14-6ed5-91c2-dfeba9ad55c4@iogearbox.net>

On Wed, Feb 21, 2024 at 05:39:55PM +0100, Daniel Borkmann wrote:
> The build in BPF CI is still broken, did you try to build selftests?

Okay, I give up. How is a mortal supposed to build these?

If I try to follow what I see in
https://github.com/libbpf/ci/blob/main/build-selftests/build_selftests.sh
I just get more and more kinds of errors:

In file included from progs/cb_refs.c:5:
progs/../bpf_testmod/bpf_testmod_kfunc.h:29:8: error: redefinition of 'prog_test_pass1'
   29 | struct prog_test_pass1 {
      |        ^
/srv/code/tools/testing/selftests/bpf/tools/include/vmlinux.h:106850:8: note: previous definition is
 here
 106850 | struct prog_test_pass1 {
        |        ^

Messing around with deleting vmlinux.h seems to get me further, but later:

/srv/code/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c: In function 'bpf_testmod_ops_is_valid_access':
/srv/code/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:535:16: error: implicit declaration of function 'bpf_tracing_btf_ctx_access' [-Werror=implicit-function-declaration]
  535 |         return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~

and then I'm stuck. It looks like the build isn't actually using
KBUILD_OUTPUT for finding includes. If I try to add -I flags to the
Makefile I just drown in new errors.

-- 
Kees Cook

