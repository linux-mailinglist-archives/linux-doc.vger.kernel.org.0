Return-Path: <linux-doc+bounces-25714-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6249861EA
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 17:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208141F24433
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 15:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A5417DFE9;
	Wed, 25 Sep 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SjU+PFdw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D41465B3
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727275692; cv=none; b=eI++7M6XkoGH7EZjUg+0GDF9UpNnHk0VHrTOON314V5RQ3jeHh5sEOWlBN+9XaiJmu/r1VhjYx9rxsk/lpLUrMq02QQQX3YKD6DgtOWgopwZ3xXgXp8OR9lpapZSb7bi7HjveF8uDEYyMJzaqNNoj61hkmZ4xgZd6ibOXg2kCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727275692; c=relaxed/simple;
	bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwoxN4gexoE7q121K45uMAqnSmx31FvzN/up3og2kVd/HpDs29F0PmNqnayhOUfAyIOkKgKwdM4qGUFSnYEmfreRLftOiDd8N/Ud7gNOhFCb1yerZxFS6gSpYEe1f8+8yqmiRGS/rn9Qx8EYjEgEd0Dn5+NABr2HE8nZVCZnqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SjU+PFdw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d4093722bso631300866b.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727275688; x=1727880488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=;
        b=SjU+PFdwGIHlI/vtoRt2UvBbL/qq68jnl03Y8sNEVsfXZ/hKMfM0WEpUqR3oNn0y49
         d5OyHFjn4enf3W+iE68YSvSyXX9kA1ngqrF/2QTi6XItOF7LVmCP03AmRCs9jk0PkYyy
         3/LzGxbH1u044J7DZDNRQmtqwoencjaBfUW+pU08CeJx12wld77WZn0KMRYJV5r0A8A8
         s+ZkzD9UpXoKtzG3X7zPmW0yHO+7HpKwdmcgYjQ5rFQPaj6kke/cYhAR2FIaQsXz1ZYi
         hSbFd1GUfu1ZAwNgekHCJT229mzYCE8cstBd2qUJcTevn/cHVTbCBJwfwYTQuOCCKEjX
         AqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275688; x=1727880488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=;
        b=DAKAH4VSXwFoGp2q0Qovq47NHuj73LghSt23IIMg32dELOVrqhtC7fzG/UITVPaorR
         /ZiLZBXOZTiUJHEPrJXrYk78NRJKkOU9F5mQtBaM1T3JVxqHaMTjeERFlusiNKVdndUh
         y9PK0lLiv+BibvvdEyI/kmXX14AMPlBbrEryrPrzHxQdKpFWvLo3ncGIiqUmfhf/Eobv
         HSFmJX4bstJHJttk8a8MGxptrCdzbPMDkWGAlmA7GPNKx1BOyusRsYMnqfqKs0yacsvQ
         FlMNLz5NqMM2pXSG/mjoPZIGRJOsV/kaDFuqZr/L5c/lGNshdY4xucVWBJzjw1Ne2UKy
         +MCA==
X-Forwarded-Encrypted: i=1; AJvYcCWSAHzEZRUnQNaQ6mVWPJ+T2j1HpP6LuujGv8crClI5wxDQmAmeoBpuAjnfK3oLiPWq1Zgeud93Kts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiEZowTicFfhJj9D3TZqnGQ/DxZu32a/Y+RFskJ0TMTpfUg0k
	BkXdnSCC8IJOYTuewlJJTuj/iKspLCFkBtz3aTYzfUU08XFwpUjnLwqkYV26Bdp69zYm3KlUIrz
	sS42XUjHChi90qtVa06dOPdKyNAbGCDdh+EfXAw==
X-Google-Smtp-Source: AGHT+IH9j/JX+iBbn22xiqIB/wV8Wbu13blKCn896GHhaJCrEb2BGvwE5HBNntXMQ3VhE//CXwPTCMbWKAAnjo/V3hU=
X-Received: by 2002:a17:907:7ea8:b0:a8b:2604:1da3 with SMTP id
 a640c23a62f3a-a93a037583bmr325593066b.17.1727275688066; Wed, 25 Sep 2024
 07:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925142532.31808-1-namcao@linutronix.de>
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 25 Sep 2024 07:47:32 -0700
Message-ID: <CALs-HssQ=ytHT6ZBfO_qNDGTepzQGUVEygCPReb=JeWVkzsQ8w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
To: Nam Cao <namcao@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 7:26=E2=80=AFAM Nam Cao <namcao@linutronix.de> wrot=
e:
>
> The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
>
> Also, the riscv privileged specification names the register "mimpid", not
> "mimplid".
>
> Correct these typos.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Evan Green <evan@rivosinc.com>

