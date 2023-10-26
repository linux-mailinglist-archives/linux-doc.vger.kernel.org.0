Return-Path: <linux-doc+bounces-1210-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E17D850F
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 16:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC92280E5E
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D422DF84;
	Thu, 26 Oct 2023 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU7W6Hzp"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95118829
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 14:46:16 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC3DB9;
	Thu, 26 Oct 2023 07:46:15 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5af5b532d8fso2148097b3.2;
        Thu, 26 Oct 2023 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698331574; x=1698936374; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fUbufR/c9jm4nMCCKXr72SFpV/0ht1NtD/NLIfrFeo=;
        b=FU7W6Hzppb6msQIdrNyHDKH8uvwbh4Mgx5AsKSXBotWAhe8ffpxyoFNFqyU/jLwgAN
         jAaDJLa4tXEz7Ybx43aBjFdZe6swDvNs7mrL1ITeyGcTJo41t1z7gO10rwJx0n7nklrf
         B+lVVyZmiW1J65uBUfCSUPyuqhdYhiVpIL+hZblCG9ISw8+W5txKKAD0If+RhhXSAv6Q
         5WnGbyUUsGukWRMFBWl6FMoBIq+A1fLYNcNjaccRXVLzStgwun/LkBhxJq4CNPoYFQ+n
         +PIaRqdaqphKm4VTvWoHseae1a3OoC8V7vaVqdlWgubzgzOAB5EaSCJlxlzGUfn7H2FQ
         ZyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698331574; x=1698936374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fUbufR/c9jm4nMCCKXr72SFpV/0ht1NtD/NLIfrFeo=;
        b=HtX5G/D8VSzJAqyVnJEykixE8XG7C53X4uQg5hjSgzPnw9z26ZVSBujcdreYn5hAyL
         x2d4vJ+D6I3KEj8FaBgMzoxebobQKaqh/kSFz8sSir6D0fqipnEU+7hhI7v+qOviYDuC
         UuL5Ig2r8HbbMLv1esEQjM80HDxG6AJMohXREMiwcyLOLqpAKEXCnfldUulNeXK3aCW6
         pmTEs86+mL10xEdfjIe+k/CuHASwR/qyofqPz6X3UQp2QjPlmYV8CewZfgnRKLjV6veU
         onuANnSAXKYZFZzLii2DMPiKB1i0HMs6dd3LuHMmTHzD0ArqcZyiFarAoqwpdzZzmpwH
         2vMw==
X-Gm-Message-State: AOJu0YzX2OBni+kmtrqEW6HO/RpUkKS0COFI+t2CKbdklmOVb18cPAf+
	aFSFru4TmJeeP6Llx9IpaRM=
X-Google-Smtp-Source: AGHT+IEyT24EznHUVkkwOVYRgeSkn2vuZYmkCo70Dwt97OPD9rrmjf0wgEqlWXHnltkue81HkZts9A==
X-Received: by 2002:a05:690c:d93:b0:5a7:cfd0:4b43 with SMTP id da19-20020a05690c0d9300b005a7cfd04b43mr25064348ywb.13.1698331574601;
        Thu, 26 Oct 2023 07:46:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w6-20020a0dd406000000b0059f802fad40sm6030351ywd.22.2023.10.26.07.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:46:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Oct 2023 07:46:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ellie Hermaszewska <kernel@monoid.al>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.
Message-ID: <6e8a5054-0082-4f7d-9443-a5dcfc159df5@roeck-us.net>
References: <df22c0f4-671f-4108-85a0-d1667ec1da77@monoid.al>
 <20231026104332.906357-1-kernel@monoid.al>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026104332.906357-1-kernel@monoid.al>

On Thu, Oct 26, 2023 at 06:43:22PM +0800, Ellie Hermaszewska wrote:
> Only the temp sensors that I can verify are present.
> 
> T_Sensor is the temperature reading of a 10kΩ β=3435K NTC thermistor
> optionally connected to the T_SENSOR header.
> 
> The other sensors are as found on the X670E Hero.
> 
> Signed-off-by: Ellie Hermaszewska <kernel@monoid.al>

Applied, but please provide changelogs in the future.

Guenter

