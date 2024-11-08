Return-Path: <linux-doc+bounces-30300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130979C1876
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 09:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 450B11C21225
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C8E1E049E;
	Fri,  8 Nov 2024 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j6QGW8sW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FC91DEFDD
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055976; cv=none; b=VMj10Vs4xuDhFBiQnV6Q5KB+4hR+BeR1YnH1YkDeF5MrgbsXlRKHojMwdAFE0WDq6NYvrn6WS6Y5GsV68GLmzcNu8X6dhtwcr5zrVe1xXQYcOu2gXZPHeNDKCESg9GtZcWWBqEyuEsb5Apm0/jnEm3NGI+8Q4JfCRCO7+hMHU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055976; c=relaxed/simple;
	bh=PkFcoKJleuYpcIVKqjj4ePMg+uxMZ0ZQlIkzmFZpuiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=naYUDR9St7vMs2VgjdPqEuWByWZdA2IYsBYtWxQ+FeYis71H5DNGsWTQc3KPqE00JkTNtaKfMRNV5+D8s6NuZLPoVb8aLw0BW0dcmmYTqlkjxpWpcwbY2d5FwTGtv0uiUMvAAszTHX2LbJiHXeQ0pvdfhwotggXDqXg0uuwrDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j6QGW8sW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47b38336so1425038f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731055973; x=1731660773; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bVEgQli2SIBR629KGbbTzWRzrwVtdlvbf9uG5F0B5k=;
        b=j6QGW8sWfGTJIzw4U6jzl4/awByXE+CDEIcUa/oXwzm1g6kpIgHn0mthJzxvfhVQE6
         xOUc2r29rskBWxqQ0mlXlK9eN26wrjwPoy0/TDKCcjTUbgzqsxtK2IOMHDTMBzmkIX7f
         NLVqkHDlU+gaIzBYncXxvxTsvoY8tqYJN0sE6HEGKDlWj4KDMI4RJP9cJs5AHu3cKkwZ
         FT7UGNCgRUGEc1MlEujTXzmcjXaHOBYN04Z/sVX8BiTCoz2rerHbI71oOaPUyn+vSHCe
         n7GBItRxmRmE0uCZCT9QZ3K8O3QnTMtnAceZhi/92Z5aS5w6asC+4/IHNW8DUrASxf/d
         DFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055973; x=1731660773;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bVEgQli2SIBR629KGbbTzWRzrwVtdlvbf9uG5F0B5k=;
        b=Y7RXmJAynpy9iFE53Osa9Yhgp4vIq2tgH3uU4Yp0OkHGMb0MoKzWT9ean382x6QX3a
         TiFSiIW7eYcQ4PWuFFHHV21Ax9encfJJVHavw2jErtepAU5caOFCptX19QqvYrVHm+Mm
         CluMg8ITZfjV34IBu5YptcAgQKJ9pcVJn3e6zgmxCjcgj4ClH6sKUf1OBIMVfgKfs+/m
         HguhvxLAcoDonfcQTjG+UvWe6hoL0sc2DBjSLDioZ5UyzMcwFooqLgN3fE1eYbY+pKl0
         WLDkV4FvgFBY7pHFKsC64CinROry+fljzzD8rBqt29aGsxD4i+/9sJ8Gb3bu6eFNyqYU
         ON2A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ84LJEhHeC1tUBNe8Yv1oJboZRLlrtdc4SxEF1YYN5LcjpX2Nmiabe/Dy5czzhbpbFt593gjgRlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywXCuVyE8PyOxXj4guoDkgUk6hZn9m8gFI/dsLMeuS6csyTD4r
	Z3y9I5ypFup31f+tB3Yci6xBot7BNgFEi1BBU8vYDi0d0IlJoc5nZJ2fsjMmFHo=
X-Google-Smtp-Source: AGHT+IH5YojtTCXPyJJ4lTGTYwMyqJoiDT2Gfsd5O7M+EFfJaBPt+qjG+4n23Bhz9LKYCstgj2LvHQ==
X-Received: by 2002:a05:6000:1f8a:b0:37d:3f42:9b59 with SMTP id ffacd0b85a97d-381f1865395mr1669883f8f.11.1731055972660;
        Fri, 08 Nov 2024 00:52:52 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05f89sm3921215f8f.98.2024.11.08.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:52:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org,  Conor Dooley <conor.dooley@microchip.com>,
  Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v4 0/7] hwmon: pmbus: add tps25990 efuse support
In-Reply-To: <e88956d9-0dd1-4a38-8a91-8175223c87cc@roeck-us.net> (Guenter
	Roeck's message of "Wed, 6 Nov 2024 08:12:04 -0800")
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
	<e88956d9-0dd1-4a38-8a91-8175223c87cc@roeck-us.net>
Date: Fri, 08 Nov 2024 09:52:51 +0100
Message-ID: <1jldxu2jks.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 06 Nov 2024 at 08:12, Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/5/24 09:58, Jerome Brunet wrote:
>> This patchset adds initial support for the Texas Instruments TPS25990
>> eFuse. The TPS25990 is an integrated, high-current circuit protection and
>> power management device. TPS25895 may be stacked on the TPS25990 for
>> higher currents.
>> This patchset provides basic telemetry support for the device.
>> On boot, the device is write protected. Limits can be changed in sysfs
>> if the write protection is removed using the introduced pmbus parameter.
>> Limits will be restored to the default value device on startup, unless
>> saved to NVM. Writing the NVM is not supported by the driver at the moment.
>> As part of this series, PMBus regulator support is improved to better
>> support write-protected devices.
>> Patch 3 depends on the regulator patchset available here [1].
>> This is a compilation dependency.
>> 
>
> Unfortunately this means that I can not apply this and the following patch
> until after the next commit window, which is unfortunate since patch 4
> does not logically depend on patch 3. That also means that I can not apply
> the last patch of the series since it depends on the ability to disable
> write protect. Those patches will have to wait until after the next commit
> window.

These 2 patches where always gonna be touching the same part of the
code. Indeed 4 could have come before, I did not really think about it
TBH.

No problem waiting for -rc1. I'll rebase the remaining changes when it's
out and add the necessary change on patch 7.

Thanks for your support

>
> Guenter

-- 
Jerome

