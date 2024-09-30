Return-Path: <linux-doc+bounces-25966-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB298A229
	for <lists+linux-doc@lfdr.de>; Mon, 30 Sep 2024 14:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE681C203B2
	for <lists+linux-doc@lfdr.de>; Mon, 30 Sep 2024 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C659126C07;
	Mon, 30 Sep 2024 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="Q8FJhEbu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE018E05D
	for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698696; cv=none; b=LkQpI1phuM1VXUg1jo+bYenn9FC/odeuSeZkLmlqqz7FEqPZ1P8seTymXl9QDTX+MUFMjpgJIoqcGl1i+oRjCjOQ1rlVJoz4Tw2IDWGjHpOIx8X6rBnz9rTRN39a2DTAsGgcEH7SKXqyl3Y/CAY8kTnDUecmbxY/PVyNeOWb9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698696; c=relaxed/simple;
	bh=KTXMcpHo0ujn+1qzOikfJeq5oh2VmZ9aQImk5g9SPos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s1bTnnFs4WYgAO3JKXhusL0wizcx3PVixC/OWfX3hoUWgnKFd0f0TW/gyrf+mv+Pqvvyx45mOlcv9skkB3pONYbram17POwMsV6SPCkjjkKMKftWQOD5twrbOrb/kwobbLqTePwZo+hIIqQr9fVwJX/ZMJkIlDhUM230AIioN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=Q8FJhEbu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398fb1a871so1515108e87.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1727698693; x=1728303493; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTXMcpHo0ujn+1qzOikfJeq5oh2VmZ9aQImk5g9SPos=;
        b=Q8FJhEbuoDYLP1LGVpiK5M/DowN1VzIrD3pvTVl+8CMdz75rwxh8gjV0RVhhO1cjf2
         FVToFLK3Tk2y7GYxBQyRt+nP7OLAdgtQ29ZArVwxfplqemLM5qHdY+qtALwgyOL0nG4x
         JXMz40pFKMLaJPlTA/srfwn7K1APYMsrwK55A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727698693; x=1728303493;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTXMcpHo0ujn+1qzOikfJeq5oh2VmZ9aQImk5g9SPos=;
        b=IrUAxr4RR3+5uRgQCMMkN5ZxEQUfEHb2rVmRCtbtzcbGepTNjOMai/Rl8MY8k8rUQ8
         9wjwjidGRQgbAV3mg29gfTUvNoV9vBnU1b/YWBE+s1pJ7bcLxuLNce910pbtDGzCjQpx
         JdFg6EkrBamM4GZXn4lkeT4raeJwj2XbxKxTgujTnmkrv3WQdJf0/a0QE4Q1/N35y50i
         BAgwSRGwKtCCEaZoYbysp39Gn2U1P0eO9uZNcRkHEdYDzZ7DamHb9Zd/BHNe5O77iVed
         TBHOYdoDdYTH+rbhahPyDRNQWjn39SyadGXlR1ZDK6tZlbScxJrFuQcYrA9osTEA0Vlw
         wJoA==
X-Forwarded-Encrypted: i=1; AJvYcCWHs2+haiYjf+C7VPgqcErsX/P06Jv7JI4hmbznS9/jdU6ObUNNvT/IbNadxC9NdWxzs4UbF6xBSzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcU66aYRc8I57eZdkXC380pvWY7N5qz11GiDhdvyqo8ETKfr5
	3zuLpGWu8Ia9wFwsaWtl2Tq/2QnbflaBFxFuZ+8peIfTyxYsLVCL2k1QRxzQqlg=
X-Google-Smtp-Source: AGHT+IH7tKd8Kb5wNmGZw9WYzRhvagjLvmoYCWVGjpPsq6iIXxlWsAAxIloMmOf4F6bN1LUzJ1JJ1g==
X-Received: by 2002:a05:6512:eaa:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-5389fc3ae14mr6437800e87.16.1727698692426;
        Mon, 30 Sep 2024 05:18:12 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5396esm1225851e87.2.2024.09.30.05.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:18:11 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,  Jonathan Corbet <corbet@lwn.net>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Kees Cook <kees@kernel.org>,  Andy Shevchenko
 <andy@kernel.org>,  Daniel Golle <daniel@makrotopia.org>,  INAGAKI Hiroshi
 <musashino.open@gmail.com>,  Christian Brauner <brauner@kernel.org>,  Al
 Viro <viro@zeniv.linux.org.uk>,  Li Lingfeng <lilingfeng3@huawei.com>,
  Ming Lei <ming.lei@redhat.com>,  Christian Heusel <christian@heusel.eu>,
  linux-block@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mmc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-hardening@vger.kernel.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  upstream@airoha.com
Subject: Re: [PATCH v4 5/5] dt-bindings: mmc: Document support for partition
 table in mmc-card
In-Reply-To: <20240930113045.28616-6-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Mon, 30 Sep 2024 13:30:12 +0200")
References: <20240930113045.28616-1-ansuelsmth@gmail.com>
	<20240930113045.28616-6-ansuelsmth@gmail.com>
Date: Mon, 30 Sep 2024 14:18:14 +0200
Message-ID: <87y139jpx5.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Christian Marangi <ansuelsmth@gmail.com> writes:

> Document support for defining a partition table in the mmc-card node.
>
> This is needed if the eMMC doesn't have a partition table written and
> the bootloader of the device load data by using absolute offset of the
> block device. This is common on embedded device that have eMMC installed
> to save space and have non removable block devices.
>
> If an OF partition table is detected, any partition table written in the
> eMMC will be ignored and won't be parsed.
>
> eMMC provide a generic disk for user data and if supported (JEDEC 4.4+)
> also provide two additional disk ("boot0" and "boot1") for special usage
> of boot operation where normally is stored the bootloader or boot info.
>

This looks quite useful.

Could this be extended to also be applicable to the four "general
purpose" hardware partitions, i.e. what is exposed as /dev/mmcblkXgpY ?
These would often also contain some fundamental boot data at various
offsets but also, as for the boot partitions, often without a regular
partition table.

The eMMC spec consistently refers to the boot partitions as "boot
partition 1" and "boot partition 2"; the boot0/boot1 naming is kind of a
linux'ism. Similarly, the general purpose partitions are _almost_
exclusively referred to as 1 through 4, except (at least in my copy),
the heading for 7.4.89 says GP_SIZE_MULT_GP0 - GP_SIZE_MULT_GP3, but
then goes on to describe GP_SIZE_MULT_1_y through GP_SIZE_MULT_4_y. So I
wonder if on the binding level one should use partitions-{boot1,boot2}
and, if implemented, partitions-{gp1,gp2,gp3,gp4} ?

Rasmus

