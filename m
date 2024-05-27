Return-Path: <linux-doc+bounces-17058-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7A8D057A
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 17:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7151B29443C
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE3D16937E;
	Mon, 27 May 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j3P0PBrQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0D168C17
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821434; cv=none; b=lkxhwe2F8VFBZXQ79bnr2kN2i21RmeXJ18ODM1SxKjF36xjyzib6Ed67CzMZOz4JeqkD5yh8AboM4/TIJbrt5D2s7dtn8KY2tKOoqEfthz6jyztGvfB0qqagXLLpUujCrDsa85UUY86Nta60XMtqS63pLz2kpRyTYOGe+cvsZhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821434; c=relaxed/simple;
	bh=aQmfaqRdM70dUl3sSYpYCvVuvVwmhdGi6uJkBkc+nnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4axQrdDstuBJ3dUXofr1ibyc0HajWzNkXWo3BYibitNoF47a9bQzeyPqDc03xcw/lh3oZNQ5ZlnSV/Y6+ESucN3tD2Yf9HkQfaixFDxE0NgJntMN01D8pt7H9BQiJ+gKx9sKS2hAmADSOipVF4WybBxvVe5rpeeuTPF11qd53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j3P0PBrQ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so43181831fa.0
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821432; x=1717426232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVxw+/vOj3sQMuY9pWBFSOW4TraL4Q9T9iSAPkfZRnc=;
        b=j3P0PBrQ7oUhCTzkBaFesPbg9bVLjzZFtCCno+rU+QYkoAvpZkQRkJUKoQa2oWTCnw
         CjS2A3lWpUGeoOznJXWYTl33FBXTdVw5uVACuTSXPxVgkjZYUcsb4f6gW4YzPCI+1A1x
         EMzFy8eYjZFe4HVm8vKnLSDskYVz/gTSNIa5w9cJKcdG+iyPekhBUwBeePeMJLox6/Q6
         mQlchTapVsEJcndn0sR+3mog8zsFidHfDYjSaN+6n669jOGBasaNcvjQ1XqHiQGVukCE
         gHppnqa6TUFpST/PUpSK4Fw6Aml49trY8sS43kndr0w4FosJshOt7bYzusS5LYJVb/SP
         fYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821432; x=1717426232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVxw+/vOj3sQMuY9pWBFSOW4TraL4Q9T9iSAPkfZRnc=;
        b=EqXFIg96ynBixQIZwSc4jyLdPQozX1d5FLQdkkhdqDcvyIWZ5hPgOjixSyYJ7JB2+K
         vnpp9izsSz5Y9/C9BNH5GsiDjK1Ov3zBMmKmLliIm7OcSZBNvPuX0BascxHJbHRq72wX
         e50xt9ri/XymCGNQ2i5yKURwAQZ3H7DTRqSwQ90ledVAbPnFioS6/4fejgH1cpRZ41aF
         AAaDjAuXDjzDNnncpEmre3xIVGfv2hRnJY/fugJXLCrPP0EpKl+TNAv998PUks1IG8H+
         wpgzfLCFgSbMT9nL66c/FXZZWlXa85f7x4rzpAnAmSTkgDjLfduncmJxB/ePu+0Mz9qr
         S/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWT2E2U72MHXt5ltBC32LUVYhGVwoTIhAZO2GO1k1jSaV4qEZ6HkEDkoturBumMpGovILeT7zIPKoc8ZCyBrYapEQ1yoD+ZYtRD
X-Gm-Message-State: AOJu0YyFJLKsZnOcxZUDkrJEirZwsIIo8PdOJz4XtplTU4bVpw7V1a0m
	ZwhY5ovwX25DSJWK/j3vRPTXO9Ta8AKKMdTvIGRl1AR1a5HTjJ/Rhx+UH8375OM=
X-Google-Smtp-Source: AGHT+IFMmZGrXNV5jImFthKc7UTTRRpbEBcF2dKZ0Mc60DCS5P4fb3NXNeGa5dqT0XkiXZKRTc+G3w==
X-Received: by 2002:a2e:a308:0:b0:2e1:ae29:f28a with SMTP id 38308e7fff4ca-2e95b256324mr76970671fa.34.1716821431708;
        Mon, 27 May 2024 07:50:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089cc504sm111600385e9.40.2024.05.27.07.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:50:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
Date: Mon, 27 May 2024 16:50:29 +0200
Message-ID: <171682142405.156260.1185957689650199871.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 08 May 2024 13:17:01 +0300, Andy Shevchenko wrote:
> In order to discourage people to use old and legacy GPIO APIs
> remove the respective documentation completely. It also helps
> further cleanups of the legacy GPIO API leftovers, which is
> ongoing task.
> 
> 

Applied, thanks!

[1/1] gpio: Remove legacy API documentation
      commit: 447e140e66fd226350b3ce86cffc965eaae4c856

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

