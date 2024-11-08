Return-Path: <linux-doc+bounces-30324-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E79C1F55
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 15:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23BC81C2320D
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 14:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D4C1F131F;
	Fri,  8 Nov 2024 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOOiCG06"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D311E47C7
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076447; cv=none; b=N8jwuPd/uu5GOjFSOMJBGpFJRas40kDGjZdY7OrakqUTijZPX8UvIuNc0JPoXsjuzwUC7x/qNqBOOt5UQAky2YaaMdV3MSOKpCeXgtcd9orB4jhB+o3nL07dYL4y8Jp6wC1HEKLyp2Pw/D3vkuRcpUfynrS3scvUbLjFkzhU6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076447; c=relaxed/simple;
	bh=DPU+D+82CmA9h5Ph6EL7ffraHSVchVSGoKUFRSRG56Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P+gw2yrxwmyhmL/EJ+wNJoNXNMj9H+xDljmFhqXXQ0gBDpp25MHTpXyo2zCfhFE/WwNRN58/nrMLx0Y4z/xCpUughg6z9X9CCIG/b0l1JWLJdWMz7wshtIPZhByJOFZwYe3kGFvPzsDT77RmyD7cxifFSgyTZ3mtVl2u4mfT6Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOOiCG06; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1471199f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731076443; x=1731681243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aKxG3gwOAGANkGkZ2NSS+guj7HDwh0arnh3SiLCSnU=;
        b=OOOiCG067fS+8RfOqDQmbO6ma7hV+Ye9d/tLATYf9EJR/o9VgdWjn7HWb+g23E1tOI
         LzzGrIUMD7k9iiKFmWSqN8VxiB66U5OJeRo7cfgEjSU0Ur0ozBaHRmDed2NuXS3qL3VK
         dDtqLrQZziRpEqYrTurIb1fdGnBKs2ApynSxvdS+0oVLgnjxfTqrrGpD5UKdFMTScoMw
         1RPHDnYJeFQo1F2iPdbij2qxgyvtd0689OqBZt9vm+HwO0Gxg9XgO5fJYsq/vr8hnbKB
         b3UTDLvCudHdJdD1FZ0fm6iEaG10Jx+WEyQa8PvNLIBMcKihTVBly9EkV7visETRe/6/
         vRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076443; x=1731681243;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aKxG3gwOAGANkGkZ2NSS+guj7HDwh0arnh3SiLCSnU=;
        b=AFsC0PEBnmKvsWmICRlnJprz2X/yZXt2WM4VHUFBoF67ovPfDI/W9ue0ebL41qA+I4
         ma0KW1I3mTVUHG28uI5zoJlOaRo2b2/ys0bbCAQXWPnBNMWOlim/HNWXRT4wYi5jljQZ
         rMDVQHd97E6i9nlqKobEoqU/63M9e16rLUPuAtMM1RG3kdjk6/lLnXzDd9c/z7eIEtQW
         aswmNmU0Z4/txo1QUf/rDjPeTmH9BuMSuqgdjzbvxcHXg/qRoXwgNR+oUCBEiQsyjopS
         JAiz+ALCgYm2JyEeJy/C6bqGS38Va7S/v7bqYlDvLMGYUDcTSjh/brg8E918twq4YXr2
         2xjA==
X-Forwarded-Encrypted: i=1; AJvYcCULk+qgou1luaTETnYpTw/w5cugzFesBkJJdpo/cZCfYcu4t6BjKJYWCVhhtiENnddBmPT47Gq+sEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwuk6XFftCgwgLyGYeUsXkFhE1YOMTC3X3NhfONrvQyydTMjbK
	2TA2oSOa5ZymUtc3AzA9yfM+GyqZObQFxxxSdvcbtbcpPIz1JFqs4u9xFiczpQA=
X-Google-Smtp-Source: AGHT+IFiQTvvUUVNBS+RC050g+C25oacYB7OQt6yFvIZkoyX4jf9tm4lHFTxhmnrBwsgz4a+MFioMQ==
X-Received: by 2002:a05:6000:1866:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-381f172a6e7mr2781004f8f.19.1731076443139;
        Fri, 08 Nov 2024 06:34:03 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99a34bsm4960209f8f.54.2024.11.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:34:02 -0800 (PST)
Date: Fri, 8 Nov 2024 17:34:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
Message-ID: <954d6aa4-5dc7-4421-9b92-4cb9a0b9d40c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106061812.6819-3-vicentiu.galanopulo@remote-tech.co.uk>

Hi Vicentiu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicentiu-Galanopulo/dt-bindings-leds-Add-LED1202-LED-Controller/20241106-142011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20241106061812.6819-3-vicentiu.galanopulo%40remote-tech.co.uk
patch subject: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080756.6eYdrM5X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411080756.6eYdrM5X-lkp@intel.com/

smatch warnings:
drivers/leds/leds-st1202.c:175 st1202_brightness_get() error: uninitialized symbol 'value'.

vim +/value +175 drivers/leds/leds-st1202.c

7e6780184dc934 Vicentiu Galanopulo 2024-11-06  155  static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  156  {
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  157  	struct st1202_led *led;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  158  	struct st1202_chip *chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  159  	u8 value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  160  	int ret;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  161  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  162  	led = cdev_to_st1202_led(led_cdev);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  163  	chip = led->chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  164  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  165  	mutex_lock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  166  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  167  	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num,
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  168  				&value);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  169  	if (ret != 0)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  170  		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  171  			ST1202_ILED_REG0 + led->led_num, ret);

Presumably value is uninitialized if st1202_read_reg() fails.  Normally
I would just mark st1202_read_reg() as a no-fail function and not
report it but here there is explicit error checking so it's weird.

7e6780184dc934 Vicentiu Galanopulo 2024-11-06  172  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  173  	mutex_unlock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  174  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06 @175  	return value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  176  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


