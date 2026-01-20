Return-Path: <linux-doc+bounces-73170-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0096D3BE88
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 05:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2260D357F2E
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 04:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6379D33C1B4;
	Tue, 20 Jan 2026 04:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFFLR4B2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC14A332EC8
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 04:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768884446; cv=none; b=HCvPDMPB9erlMnQTw6yTt+BAaKC+A6DFjgAeC+B+CPMU5Yvt3tAyDLpNDOu0dbFTr0mmXjLmkf8lyw08pSCZHmyAALINhbascqZR2sa4zkv3BxYcgBN73vhdUzJGCeugpmFf6risZCLyn8TZn04IuT6SZ4wnR5U/dX0a7N3qgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768884446; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUDdQOANKN9M1XH479XdaXrMGv+555YnXbyShcaD15F7jaUGhhMiuzKQ/2vu4p4arrd2QRCCx2mjB+TDEiGtB6t6tQNo9/BzssMMZLwRNZrCLdLmiPkJPLlimZK5+7k6AJWAhMF+pAkn2+DnFM7lVC51BXKleYWTwjGdMj5qYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFFLR4B2; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-661106487f9so4993393eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 20:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768884443; x=1769489243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=EFFLR4B2LEQ1h3TOilRRfEsNDy6prAiJFBaBHNO8lylbNd9ppeD7DUZ8NQhpJaCijh
         AW5hkAIpKR4VrEvDwBusD+1jLkTWtm8GbBNmQtbitsRpi8ylBnMCL3IRG/4BAi5bjeaI
         HH8SNdyh+0lmOLtxc+CnXoWePN6k7jV8CRspWe4aNkewgexFGQ/pRr7yb8QQCQrbQJ2F
         +NrKy/OtsScs91dkHemZ5BMR1dHuKXcfrLr0aMjAD0FwwLnDERHwsviDesSMEbqwbmQv
         3HpnYzKnVpasBS+C7RbrIyybhLpGtS71qxqLBG/qhuWm/ZJeXMBx8nKb5mTXArpcURYV
         LIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768884443; x=1769489243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=FppAE9OSj/A4nkIN5GmQ/oWry6jcpr2g8O3WdZUusfYh4WaPKR3GBYUgAlQnBWXfh4
         H+Ce2EyUGMPKWaoRf8m2b4Y44sywf1E9jqsJ51CT8P6MTqSelAcolps/OlC8Z2EmsNI3
         F0Ue/oqdX9QdmrfoEUlSn9bJ4lVSrHwCSlbL0QJ5d2KdW3etfHsxqaS5NI2cFDUDrkf3
         AgGzf4d9bqU44VMD6R1v784LjsThsoau+F/mHIDwrnCKFbvi+juDLKS7mLNneusroh2g
         Y9R7E4cBvcZWSDB9GrBL4fG72MUM9SaPfbuA6yc03obSFjA4zD7KPZpvvhWlrRBc7hbC
         dOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaw0+FI62iSxDO6ac3HiKPEl/BuLQpUJidzGz5AZwm6+Y/xczqBeaMYfxeJs6uPguk7A7GTYNDJiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FRsimpBzvx0LGktKCrdnJp6OtAn7Qsb4cMJs2zbPH1T4XD2M
	T3sA9WGv+sxFguhTLUl9MUhK/YoLFx4CKU28S0B76ngX6VCzgrglHYW9wYWdtjBm
X-Gm-Gg: AY/fxX7JdaNuZJ5/8O1AqJ2i5hlRXHDLMt9IcQHI8Wb5j8xhZ5e/yGKa+e8A0LjQMvc
	Ff8Ktr63zmuZgSA+F6TQioIRBrdCMxe4c9Io7ubDBERGGb0uK4+OqvkBHQY1aVAUCuG0A2rv0C8
	5yloG7FaVbGRL7CAcwubNMuIMrFzq1ZHNQXDDKu5uwxTiKgC9/anDzyOwyN0jWRdHb5WEnYzIv6
	MYXKJlwhxBBEssnS8KqboMrn6UBKUB0HXKkO2KyPFwiKri3BmymGtN+xXCZ8jTIbCAheVGcphE8
	IJ+RWBoCWzP0rfTcfqyUOBbTFpIhGboa7ZanOJRe61Rsu+zxwh0YrdqIYFyTcyKzfrVqQWVNBmO
	KMfLXlcTuxv/1BXpvelqb5dYhFAkRMh/kVMaMRwx6aFLZgkoa/kLiStyhV5WwxhGOhvjlmKRmT5
	fqb3y+uf/GXA==
X-Received: by 2002:a05:7022:925:b0:119:e569:fba6 with SMTP id a92af1059eb24-1244a7195b4mr14136099c88.21.1768877353611;
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm16856206c88.2.2026.01.19.18.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 10:48:55 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi


