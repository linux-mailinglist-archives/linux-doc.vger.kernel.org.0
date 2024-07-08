Return-Path: <linux-doc+bounces-20245-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580D92AB22
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 23:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D3F1C2164A
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 21:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D82614EC5D;
	Mon,  8 Jul 2024 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BrFEH0TF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB214900C
	for <linux-doc@vger.kernel.org>; Mon,  8 Jul 2024 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720473938; cv=none; b=vAMahbSq4s3EFRmMh4YG9nkWHTQVeEQa58yWJBGDzYTH0tZSg9qYmuezoEET2BoQTn5uthbctfVAQcC3N/DJH2GdTe7DZexzTG+EsxtYGTtNqtspNKPmoHgfN0XyivBQ3Y1sHshEXtV7O1a5iseu12MS9Zo4d44yR9oDeZR2WyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720473938; c=relaxed/simple;
	bh=7JctZJAKiS8OEudEyYr/ynOmVp0voSFvu/g3pykv3D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQYjusOc5sTDo3wVlIIaToZWSvbGmXLC5FIrVC9qZkIMrVRgzH21nf3xdsYzYSPLI1QnWNXMUdxDwpXxcdqsaY7c4Mk+Z2p56Tck4BGSNQ2zHHTRcGvpmY1ljAXbPsNXx2H5FdtJrrkoARR4+P6XEttTUmF0oqxGAF3NFyalNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BrFEH0TF; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25cba5eea69so2187903fac.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2024 14:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720473935; x=1721078735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJvFU7TYtpQ06K0DjMCeUx+4vp854MVTBkG3gu9NGtM=;
        b=BrFEH0TFO/sVO7amffuQwbUgj3tcoE1Z/l702jjZY9TMQl173pUcT2uiQl7nyqVnuH
         K7KqbPqGVUwUN+uMec7k/rD1soOQHcjbRa9jgFWSIGm1fmi2wBzT466XVfbH5WAjs3Ra
         CMcNj04TEE9CaoPXDgfNsC0I70JS7YR0QJesCaqPFeQcRIXWp920wDuY/2NoC2grPgvR
         f74uea0Qw39QZzGA0Us6hkDDmntJcY+xw0K64BCr7Y4G7zAfKKTfb2OnSmAWnD8Qbso5
         zZZtJATBIjvU6N0Ojwhu3RFhc81RR/aTyvzmmfTk71soOE4JtErqUxNJvZWjEBgZglZF
         fTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720473935; x=1721078735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJvFU7TYtpQ06K0DjMCeUx+4vp854MVTBkG3gu9NGtM=;
        b=bRm0ldQ3qRbuMctCAhWlyoSKO7ngvB7uF2zbzCM0uwf4QkoZvNzmtPU18TCp+vJeiu
         g6+DwJNAzqBb/kKgvApRScE4GXn+XKArmX4iC36cT21xpdORaW/dJsZ5omRVR31kqkaF
         b8CtYS4ysS9iDYa1mCDwGqznkXgsxHQPUx0iDksdERkUSToKXLyBZiTc4bHjAOFTuJ1T
         qCrNvlKxd4wwXcWybaXT7s3zGokB+w7E83hPG8OB0bQBSc+/gtU4p22mQRWqBjlC4byk
         2Lx1sJofT5+2/VnGSGSFJrcD+3S/rn8GB4fptadDG9P+Oo9OyeFGrFDb+p5xIakjgxpR
         lFog==
X-Forwarded-Encrypted: i=1; AJvYcCUq13oZanyKr06OOYbpvITAFo+Ut5Z0gHrPcI6UkFHq9E9U561Td96eJ4OB7hm3XL10tNYcfBg0r8stwsilz/J8mxcV8r9pboiv
X-Gm-Message-State: AOJu0Yx7qKm8k8q5Abocbz7qt38GzoJt1RtEC8pf8AdCtP2QFoFI4ywK
	F6dMsBjnIFZk+YwtC1RNJapuXyqYSGmtNJcxcpxROSzczzzbM/jqXlu/GmmXlUI=
X-Google-Smtp-Source: AGHT+IFibYrQLzTfmVuZB2cwTblZ0w0GWvA/Rp6zMFtf4QieNjy5zWIw9c6j8/BZsVvjrbrriJbOIg==
X-Received: by 2002:a05:6870:2105:b0:25e:1f67:b3c2 with SMTP id 586e51a60fabf-25eae756dc3mr544905fac.1.1720473934739;
        Mon, 08 Jul 2024 14:25:34 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9feb688sm194630fac.20.2024.07.08.14.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 14:25:34 -0700 (PDT)
Message-ID: <d4505dbf-a886-4fbe-8305-9ebee22a46b9@baylibre.com>
Date: Mon, 8 Jul 2024 16:25:33 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] docs: iio: Add documentation for AD4000
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, broonie@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nuno.sa@analog.com, corbet@lwn.net, marcelo.schmitt1@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1719686465.git.marcelo.schmitt@analog.com>
 <d5f07e2ea4f4aaae1c13ed0b1b0c6abb15492a67.1719686465.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <d5f07e2ea4f4aaae1c13ed0b1b0c6abb15492a67.1719686465.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/24 2:07 PM, Marcelo Schmitt wrote:
> Document wiring configurations for the AD4000 series of ADCs.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>



