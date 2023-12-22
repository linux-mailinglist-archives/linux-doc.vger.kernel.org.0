Return-Path: <linux-doc+bounces-5843-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CD81D05B
	for <lists+linux-doc@lfdr.de>; Sat, 23 Dec 2023 00:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014391C2234C
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 23:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05438381BD;
	Fri, 22 Dec 2023 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="chNSw9k3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB4381CC
	for <linux-doc@vger.kernel.org>; Fri, 22 Dec 2023 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-781251ed685so123675585a.3
        for <linux-doc@vger.kernel.org>; Fri, 22 Dec 2023 15:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703287029; x=1703891829; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CpW3HQ3edIB3pC1X9J+ZszFBlQ3pCTa21G/iZStcgk=;
        b=chNSw9k3tyBBgPYw368jZIK4B/DunMkafbHBcScFFElE9LbZVaHnoY6/WC1411wKc1
         qKENLCvlnT6EwlBVRhes/VZczfvM++sNQqp4b3Bzi/Y7+XVEEPBdcLOqaN0RqovkQQtC
         iniERB8qCeQ3xG+6mVjD2hF/2CE5XWsSPWA0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703287029; x=1703891829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CpW3HQ3edIB3pC1X9J+ZszFBlQ3pCTa21G/iZStcgk=;
        b=I7Ck5hZwlKPIs+fc0l4bHq0mu078VA0M4m1KfmjjrhHnli3/gtVRlGv8XpcdpmID0m
         e3L1Rvt0AHAebBAGbjiiXC2+s3vKkcf/Wb24V+U47gKrjohX4bLPz0YK4rXpGKGW3ldG
         wgRvxaI6cRnNqoI0YwXk0/Q+B0r4KObmS4NNQaZWUkCK39LgKjGp2BTIcQ0EB9mM/INW
         mgBpHFjeM8Yv6re12N+f9AXcXkSjCv45nZVCKQ8rZRGRph4D4rAS1KtOroDD84pHvYWK
         SUP7makRZaog5IuyyGRMYrm6XP0RDHq8qG4kDVvi0LKGYYwnk8UyU9fXyv5iYuvI7o2+
         vIsA==
X-Gm-Message-State: AOJu0YzuGBynj7izpSIztYj2i3hbHg/WzIIlIOYqSa3gHXUIQpfz14B0
	g3THt4//2wvE3nphsx7ax1y3+C+T7KHjTw==
X-Google-Smtp-Source: AGHT+IHS2SZicxvBAydDZ0dczVgPVcMjllDPAaqVKpGvtypPcvbU5dRrD+q0Cevn+jgytzUmjAUkXw==
X-Received: by 2002:ad4:5dc6:0:b0:67f:43ef:c8df with SMTP id m6-20020ad45dc6000000b0067f43efc8dfmr2476193qvh.98.1703287029358;
        Fri, 22 Dec 2023 15:17:09 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id gc7-20020a05622a59c700b004260c76e4eesm2221739qtb.27.2023.12.22.15.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 15:17:08 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com
Subject: Re: [PATCH 0/1] clarify intent of fan min and max attributes
Date: Fri, 22 Dec 2023 18:17:05 -0500
Message-Id: <20231222231705.4338-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ce60c838-0fad-4bb4-8af4-a94d43092d4d@roeck-us.net>
References: <ce60c838-0fad-4bb4-8af4-a94d43092d4d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

> I do not see the point of clarifying this for individual attributes,
> especially since that might create the impression that it would possibly
> not apply to other attributes (for those not reading the above
> documentation).

Okay, fair point, I can see that lead to more confusion indeed.

~Ivor

