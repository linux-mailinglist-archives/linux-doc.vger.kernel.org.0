Return-Path: <linux-doc+bounces-41455-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443DA6ABD5
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 18:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2271636EF
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9751D22155C;
	Thu, 20 Mar 2025 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YHgsKRfP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224F1EB5F0
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491098; cv=none; b=USAtP1Zwvb1pPkWdP9N6/1MQkAsak2QG9aMDrT+UnTFAZfK09KNs9gGwwUaZ9Ps0XSYoKoiNNoxH28X0CZ88CeWhYB9yux2zudVsfduJGujfo86PSbbYIZBfQN7O7O0CR+8RGzmvRU/e/JqHJ7F+wWSkOOon0l0fnan/zg5IPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491098; c=relaxed/simple;
	bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LP3vVndu6WDu3H6+x+86pXn262G58PLLnVIC0blsKXKraZtuPjxvWCA53SP9wQjqQ07amP69c1yr5tslv08cUpBXsriTmDvn+sKZhudG8vqBfQECpPtct4FAZylqid5bKiW25chytxJBopRiITeeGaxSIHivroTNRKf8K6Ud+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHgsKRfP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so1480162a91.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742491096; x=1743095896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=;
        b=YHgsKRfPf2/nBiD260ANuo5qn3IAPdiMNnoxnuLCprv9Owqxk5Kkyo2SoDWa0RKRol
         iYMIEdX4+eG2ZvmRhzvtBhrl1gmZYGhSpNf/vEAUhBK0Tw7zHng1MqpbWWQ0gFfi6pxi
         /6OJkbLTti8JDeCXHBxE836tbZjU8J1WurYsSEKnCUV0dGmm1dVrsuvEAQw/0gsT1rHz
         xrqNSOY/MDRaul1Gi2uPBL8SH+zeyMa1J8KqHa1PZTKTN8WJTaIwUXHk4Wlz++7DyqQD
         1YSBxXLUNKdZdpp4Vm319W5pi7CadEuoygSUsLKjeq2reBB4BwSGpKokHYshcLLJ2fzE
         jeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491096; x=1743095896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88p1w7uEcFSCHYKOCDuBHPZGg/x3AAPkfIOOrr6qmRE=;
        b=Syf5lsea2WU81dvKcKkXScKobua3B26+jsuZXyM3pPtbI6ZsMuNpsKoYnDpFnlXDYn
         5rJuMfirsXRQkZpANU5xi3evsM/lH4BtOqiPlsYrDi2UvXvOrMEzFqv/JzfLj3zledHU
         ktZXwSL4KeTRpRF0IwcvdK2o4pMdzYxPlNg7pipzlRn+gUqTqVwrk+gKXgnYx+0tK13p
         MdRa67CAfXrM/orv4sIOAzS5irGolPgrmGv4azd0g9vdEykzZOlw0JQ7Fop/JkVsPqdm
         nw7frOdLAs9Y0oR2XP1iaIrcQaq3Ycvghjq4n0GlSw1SFYyRV8N1WKkglWlwtuQ97EzH
         ffFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9/IUY6xuTS0llC5pKUBIZyQIDcery3sMd/cBXxvG7XrQ9DOsGvSO1Bml6tX1T4G41Es5i3+O9GHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuX2yOVV6KrkhlDL6XbFrSy5yPI63AeY8qQiVosaCKfg0DeTaa
	OesQ2AGE2TBbIg/kmfMGF2n5sz9SgGhiFy0WvHrNLPrK69wc1ACwmfeDmu0Y8dUl5sEo9x5iS0q
	nJN2cS5c0qexhihUy8g==
X-Google-Smtp-Source: AGHT+IGpaoCewgRhvYW5fa+HpkkDxI6GYIKVShvL+72MGW8IdbGecEsEYFRFVCnEraF7VtF/dPJ/f4MPXZFrOdbn
X-Received: from pjbpq9.prod.google.com ([2002:a17:90b:3d89:b0:2fa:a101:755])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2707:b0:2ff:6488:e01c with SMTP id 98e67ed59e1d1-3030fefe3e4mr5163a91.29.1742491096376;
 Thu, 20 Mar 2025 10:18:16 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:18:02 -0700
In-Reply-To: <d5f7379c-c66b-47f5-bc97-eab90ab34346@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <d5f7379c-c66b-47f5-bc97-eab90ab34346@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320171802.2325561-1-changyuanl@google.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: krzk@kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, 
	rppt@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, Mar 20, 2025 at 08:10:37 +0100, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 20/03/2025 02:55, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> >
> > We have all generic code in place now to support Kexec with KHO. This
> > patch adds a config option that depends on architecture support to
> > enable KHO support.
> >
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> What did you exactly co-develop here? Few changes does not mean you are
> a co-developer.

I proposed and implemented the hashtable-based state tree API in the
previous patch "kexec: add Kexec HandOver (KHO) generation helpers" [1]
and then added `select XXHASH` here. If one line of change is not
qualified for "Co-developed-by", I will remove it from the commit message
in the next version.

[1] https://lore.kernel.org/all/20250320015551.2157511-8-changyuanl@google.com/

Best,
Changyuan

