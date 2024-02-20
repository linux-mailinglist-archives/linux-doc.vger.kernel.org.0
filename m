Return-Path: <linux-doc+bounces-10142-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FD85C402
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 19:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD216284D10
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 18:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2064413475F;
	Tue, 20 Feb 2024 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="keLjzovI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888E12FB38
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708455180; cv=none; b=p95U2QiuEw1/rg2f0ETbgkTsaR5ldoYM9YkGKTxFBlNoWUt0EeGXQhhliQeIxn+D/DFyPqzw2T0DojOnJXr7Vb8/ABjDI+X0/DxdBy9WkD6J6WPU2lYDTpkt5CnrIL34A6JOj2oY4kQ04nEwndjsj7zeqMLYW0npywzY+KzpFHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708455180; c=relaxed/simple;
	bh=CVIv5v7FW9q0p/1gcpjdt6M8rpS3zScBxTRDYlpKUvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmKhZyvT6mQsJ8x5McC+Q22uJ24rocI2WUbZfTPwLoK47GlnJ7giJBv8pKKWfeOfx6htV4s4JMsSTnDCq8OHAk0yfTOkHhw7KziLB+SwOz79FENM0Us9pV+AVpEuMjZU6DM/5Xajhy3I7+B3dFWYOi+ejCmEQTcHNPbGdrqrdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=keLjzovI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e22e63abf1so2171576b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708455178; x=1709059978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttT+oUr1Lbw6TB+hJGfXC/KcUaPT+W/hoj/H1Fnb1fI=;
        b=keLjzovIo7xRpYovVlbwUDTnk+C7HkhXhgGP+cKa1wnQTyW6jiM4m6qAcr6SJQ8NPC
         fbb7Js2GOaamMU1crSqHeTj5MA6bygsHjYTEmgXqsvy41Uo8Y0HbWRQDkSuhA58f5MwK
         LCHh3qy1jEcArd9ClxXcg6icTehX+4CGJwsKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708455178; x=1709059978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttT+oUr1Lbw6TB+hJGfXC/KcUaPT+W/hoj/H1Fnb1fI=;
        b=oor0x5jfV9YMwSBdC9zwa5dMUTiUmV8xosmj17Q5dlstR7PNAF5U8MlXq0hrDFtRM7
         7iQB0Q5wM45bgAA+erFKlXx2qtmSuPUyzbb/HKPF4WlGZ6hTdyq11QX5uyc7KrQjJQ/s
         FG7ziUD6fHWFmFqnXpnTp8EYkS/5z9hJqbUI2RbJ3j4O8gkhEyWJGB5MFjCix7DepJin
         FzOgfVFSujm6VGzU2vw5rUxIAeyY4CJXDtuS8+6ZAlKKMaLZtoNeIq0SUN+zvuhukKqa
         kZbpLMOuTzBJpHK0NghjUKgVx1CRFfLBAFw4i9ht0w8vfznWFiuHIWgnaLNZPOJgYKvV
         xYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrUx5Fb8MMTuFRye3GvBye8dKjUJidoxAHjFtsRSBcrsCCGC5Qm0JTGkCPkKj9BIookfIm/ww/b3hiSp3OA8JvpBlfGp5viU+7
X-Gm-Message-State: AOJu0Ywfslw+ejqUzMy9DI5z9piILGQRuwXRX+XfMUZNvV4l1Ycapog1
	4+SuQj+UNPfAnbPXmwHBstDLPQQ4pTpuqKxAq79iE9OpB5Ltit4PDyM2CxbQYQ==
X-Google-Smtp-Source: AGHT+IHrej8hZxvh8ObZCBQw/oYcL1rzqinGLYYZLTe32ck9lbjWsRs2uBkQ444OkWqu67gne0W3Rw==
X-Received: by 2002:a05:6a20:d707:b0:19a:fa19:23e7 with SMTP id iz7-20020a056a20d70700b0019afa1923e7mr16735038pzb.55.1708455177721;
        Tue, 20 Feb 2024 10:52:57 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ka26-20020a056a00939a00b006e4831f3304sm1053520pfb.208.2024.02.20.10.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 10:52:57 -0800 (PST)
Date: Tue, 20 Feb 2024 10:52:56 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v3] bpf: Replace bpf_lpm_trie_key 0-length array with
 flexible array
Message-ID: <202402201047.DF40C42D24@keescook>
References: <20240219234121.make.373-kees@kernel.org>
 <4a4fadc5-5aac-3051-f1e6-c56d40350e35@iogearbox.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a4fadc5-5aac-3051-f1e6-c56d40350e35@iogearbox.net>

On Tue, Feb 20, 2024 at 11:18:40AM +0100, Daniel Borkmann wrote:
> On 2/20/24 12:41 AM, Kees Cook wrote:
> > Replace deprecated 0-length array in struct bpf_lpm_trie_key with
> > flexible array. Found with GCC 13:
> [...]
> This fails the BPF CI :
> 
>   [...]
>     INSTALL /tmp/work/bpf/bpf/tools/testing/selftests/bpf/tools/include/bpf/skel_internal.h
>     INSTALL /tmp/work/bpf/bpf/tools/testing/selftests/bpf/tools/include/bpf/libbpf_version.h
>     INSTALL /tmp/work/bpf/bpf/tools/testing/selftests/bpf/tools/include/bpf/usdt.bpf.h
>   In file included from urandom_read_lib1.c:7:
>   In file included from /tmp/work/bpf/bpf/tools/lib/bpf/libbpf_internal.h:20:
>   In file included from /tmp/work/bpf/bpf/tools/lib/bpf/relo_core.h:7:
>   /tmp/work/bpf/bpf/tools/include/uapi/linux/bpf.h:91:2: error: type name requires a specifier or qualifier
>      91 |         __struct_group(bpf_lpm_trie_key_hdr, hdr, /* no attrs */,
>         |         ^
>   /tmp/work/bpf/bpf/tools/include/uapi/linux/bpf.h:91:58: error: expected identifier
>      91 |         __struct_group(bpf_lpm_trie_key_hdr, hdr, /* no attrs */,
>         |                                                                 ^
>   /tmp/work/bpf/bpf/tools/include/uapi/linux/bpf.h:93:18: error: unexpected ';' before ')'
>      93 |                 __u32   prefixlen;
>         |                                  ^
>   /tmp/work/bpf/bpf/tools/include/uapi/linux/bpf.h:95:7: error: flexible array member 'data' not allowed in otherwise empty struct
>      95 |         __u8    data[];         /* Arbitrary size */
>         |                 ^

Ah-ha, my test build of cilium happened to cover up the lack of
stddef.h. Fixed now and sending a v4...

-- 
Kees Cook

