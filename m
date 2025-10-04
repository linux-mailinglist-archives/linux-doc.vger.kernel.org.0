Return-Path: <linux-doc+bounces-62436-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCBBB85F8
	for <lists+linux-doc@lfdr.de>; Sat, 04 Oct 2025 01:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 466274E321C
	for <lists+linux-doc@lfdr.de>; Fri,  3 Oct 2025 23:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1C6267B12;
	Fri,  3 Oct 2025 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XetpY5Pj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB74218EB0
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759533440; cv=none; b=PYoF1L4+K7hKeW1OX+oRLO7j0fH8RgBKTLMHIXbnOuCtqIFJ/42oJm1x64YyZUD+cOf9de84rohCO6c3zCOfCLF4wmDfUYt4vgNCKr+4bohfrrWIqf9+VUeSmyxDP+d7iWTo2qs/zIvg++Th9PI/uFg/kcCPTv7PPxfa2OFRf8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759533440; c=relaxed/simple;
	bh=BqNIw1YGmI341uZYGrCWK9ZhHORfzlcwYubDz9DWoW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha5QnWNDXGxcVCFFueTwJLvPzL4DBFoMejTBz+RwfL8ULQGcuumDK3EFZv823yXe5iR8zC9ez9cOIJqoypJPfiUC6FcsCd1+bdH93LrC9rx4LCqPc1C2+fvF0qTgrQO6xsuvqH16OzR2ukshhcPC4nUM23NqkaHb4YSRv+S/H88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XetpY5Pj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d67abd215so86005ad.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759533438; x=1760138238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqNIw1YGmI341uZYGrCWK9ZhHORfzlcwYubDz9DWoW4=;
        b=XetpY5PjAMWK0IOYd8nDy+TbjJdaLXTajVqcGgpmrobza4UXAfEs8clIz+0LzEhGwq
         6yP+sUOS40Ce+2HfMF1nav03d5xZtI9sevUpmXbmsPG9Kz7KYH9jvi5NM28Wb635YpiU
         A1z21d6hjlkPcfTp+PL19oRaA4wgCpvyngI6zQmsZAhGbL88KAXvNCZCGoQSHR1EB6fz
         P7eT08ZIa2/dKA7CYXM0eL0t8d3vWA9BdmWQnjHhaEI0aajaI7AWc3EAGvyGprBJT6sK
         IGMnG6b542ZNyA2DsNfEDvmtWIfShzS1VEtBwSzK3PB7+wfXPc+hJ9MJvKIj/sbcb9Xb
         fzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759533438; x=1760138238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqNIw1YGmI341uZYGrCWK9ZhHORfzlcwYubDz9DWoW4=;
        b=o8oKRpG87pliTEz+C2V9OAojykaKdOKy5Frs6EDqHGUIjiGXNpvlFXuNPA0H+KJxyc
         pSWoWZ0rsxYx8+DuzgkOGzCIXbUi+t7+2TYafAiPndiY50s7JCo8aRf14/Qe6BijLbP+
         2qkZgjYOgR1glNZqqS6Hb3ejOxo+ZDJgxasor1gqLOLQmoKbZSNSogLpMm7MotVYAXwF
         K04Rzp+H9XHtENgmJkSYWC8pooNXTf2Zc6cUuTlhp0SRISXGE6+59cMobo4UMTPZyxyv
         MSFNPAWHtbRDMY4R7of1ZyUDHsOFQEjYuZ2DfZ6qtOqYGJl2EOFpTvpeAxc1IV7YIhQi
         Cmeg==
X-Forwarded-Encrypted: i=1; AJvYcCXS2qmPIZrIcEEi+7AtyBlAsk7OjkuPBGs1cuZeSa9Td+MCJpJlEkMBh2JxfbcUXJg8dVbohs6793s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfqMjdIoeWNASeZWDTCgdYU9IeXINxvlUUwnGiC9CNseX9qW0
	wNA/NCQG/gClxVVl2LqwgipXjsvHcJKP+ut2Q1TADLlZp91QNjpe2Zh40NbqdWdwvg==
X-Gm-Gg: ASbGncuU7oCq+pjlwhoKjlKXexQRE97Wljo7mJLj+SSoFTgjhIa2laAgOEkI+78l0Hd
	zcAOFDmN5CU89Yoeya43oUyzImKUT7Q6oAh7MiysgxIkhzAMC1MAaZUM5nbNuyiIPk1ZYVE5bTR
	bfm6b0wMbBm0us5X+zhGPWjtFEmIhpETeTAHUSskesq190S0wRnsTiqeJ68351iM12wkJPmXP4A
	+/ukayNUg/bpqvUoMZmJ/+4J7NC34ANxD7Jht99sqyEVpVO3KOlkiYJ5h9vtJ0njF3NtD0OV4qJ
	WeX+zdsp73aD0wagEk+46RX5utjTHnSHLjKZYNQMm0Gtj6BxmQ+0SFMVCIxKH9L7ealDd4axWiK
	UbnYNOUg6vT7kjD8Ew9zjXkScdVy5itB/Q0L88hNOVduK6JlMI8OQwJRYVhdAkv5U+QTE9pKVVp
	Q8S8lpGY7E2ys=
X-Google-Smtp-Source: AGHT+IH2PZQKML2R5n+BBFPUW8xCHC5Y8Kow9Od4wnT5GRTXGwVXHZ46Mp0pjYj0WarzaHWz91nJyA==
X-Received: by 2002:a17:902:f68b:b0:265:e66:6c10 with SMTP id d9443c01a7336-28ea7ebef98mr1733985ad.4.1759533437467;
        Fri, 03 Oct 2025 16:17:17 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110d91sm60950595ad.5.2025.10.03.16.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 16:17:16 -0700 (PDT)
Date: Fri, 3 Oct 2025 16:17:12 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net,
	brauner@kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, saeedm@nvidia.com,
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com,
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com,
	skhawaja@google.com, chrisl@kernel.org, steven.sistare@oracle.com
Subject: Re: [PATCH v4 18/30] selftests/liveupdate: add subsystem/state tests
Message-ID: <20251003231712.GA2144931.vipinsh@google.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-19-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929010321.3462457-19-pasha.tatashin@soleen.com>

On 2025-09-29 01:03:09, Pasha Tatashin wrote:
> diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
> new file mode 100644
> index 000000000000..382c85b89570
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/config
> @@ -0,0 +1,6 @@
> +CONFIG_KEXEC_FILE=y
> +CONFIG_KEXEC_HANDOVER=y
> +CONFIG_KEXEC_HANDOVER_DEBUG=y
> +CONFIG_LIVEUPDATE=y
> +CONFIG_LIVEUPDATE_SYSFS_API=y

Where is this one?


