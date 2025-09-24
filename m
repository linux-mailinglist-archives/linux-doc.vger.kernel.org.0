Return-Path: <linux-doc+bounces-61682-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70794B9A504
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 16:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30AA4173720
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629CC78F43;
	Wed, 24 Sep 2025 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOo+Gpt/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BD1B21BD
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725023; cv=none; b=nLmNRDdZezHRjz9Fl3NRdAE2RVdoe/I46B0+iX6Xhuenn81XoJJ9qx7bhp0YkxExyuUNSjzK/5nC/K0KlYcnLXy3zZWT5lx6OM+oP9qEZ6gStSkg/RaeSAmGjUf9ga3O09ig+IIDaRfXn7BnKl92CjhYEOW7XB2m/g/2vkFS3/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725023; c=relaxed/simple;
	bh=9DMfrgjN4rnqyaeNGDI+SNpIuhRxBA9gdwSamu1Ca1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBkaXmdoVLJiQj5NlD+lqq7c0k1pjVCTBBzp1eZ/HbFbQVYO2JdS906GkJWagHprQmDw/0B9znK26IDsUDuJRWy0J+Qn9ZgNeV4hZiFQ+BkLFY0UvacsP75vknSl6v0D7kcQvMPo5LBDNqNExtub1EcgyFDlDhE2DRf/WNNLU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOo+Gpt/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-25669596921so73974935ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725021; x=1759329821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoQIwHnAedYHW2ZwTiTqd0HfpwsJi7a/PfALZCLVmnI=;
        b=KOo+Gpt/Ro6bOAO5JM8VRHLhBTB6kJBuhy2kYGwwoM/gHsTBdte2+MUIbHj2tv0YuT
         Ym0TpHtBS1oWaRO8Xho5sPTQsiSQS/vB851JPOlJ4uNbjxEXkSDTTuxnD5mumDsw3gHS
         s0tdmjy/z/G8zQBvTKkGUUhvK1pZ8l7WNq2gAYNPMfhtvd/bep23wc9vF6T2aJ2+EgNg
         iezq3un2hgZibhc0RDbmM8WZE6rO5jCLdsWUed2K745I3IfAnInp0qAr9wY45wQ6QXiF
         FDs2kgLdOP97Cy8bkM6Owem1Z+tqSWxsm2FRKw2jI06lrhcCNUQU4QmrEQoyk5C800VJ
         9FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725021; x=1759329821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoQIwHnAedYHW2ZwTiTqd0HfpwsJi7a/PfALZCLVmnI=;
        b=mWhCGolltDENtMUPd/ganKKOKnobzsuWRXwYl8edDXEWNdTEUp/3TxIBEhOu3MTNbo
         3pn6RyS42TdutcNtwPerVmaRq+SgX9cDUjFgvLr/o9v64KxqjtJz7JzVt2Fe9AOf+4Rw
         7oW9X4ZGusuHVhd99XaAAJNVHLI7AmyTe6IfdOvY1i9NCD8NPd646Jc3SleF5Sed3cBq
         uCzocafmG5wrab8M4dC9K6DZPN62GPpTMqPLy8l5u44d1czWF8h3hkGMplS/5uN1qncO
         x+lVgPJdAIVQi0vPaUurJ8ZN28IWO6DQJswX3Sxk1ktAW5MruqZHvi+wsYSzAKJdbNy9
         dC1g==
X-Forwarded-Encrypted: i=1; AJvYcCXzo1znu8J+N0cyteL2Tltl7GzmgA6skV9ruC+dOVYQFRI4EsvMphV4AvysST3erE5TIH9AW99/S1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Htk9m0b+fNP3Zl0/34RcgnWIZLZ6L1GdPT7RlBD9EVjSqvwu
	em7ug8OEukALwqQHL590VWA6rOz0vRqTBA5vKUgVNQbw6FiJDS1YpavP
X-Gm-Gg: ASbGnctGwPEF07eXfGJNh/gmoWk1SnErVJehZnbHEc7udfdEZRthxF/HWm9MO4gDC8F
	qYVczyhhHl9tiDqCAI9HAZcMbhtPhCLt/8M7YuRQIUyA+gMdH8Das43SwJAzgg5tGD4qrSt1Epw
	WaQXK7+kido7Lq5gnEt0WGGLiaB8JzkGYqZVl1WpGrweeXrehlkrH99VxIFd2JqpodDqvvgJe0j
	LKix67Hg9rXRqGvJCadY1UcoDrpU6ThDhAqq14tS9AJWeJHKI0rSuK6h44KkpdrEGEti8JlUWAO
	7kkxvFTi/g4gdLTRhRes9pxwvmEr0BYG6ZVbg+FYGnOK0N43qVEVaw9WcWwbVQObm/RUJQOFKPo
	uDU4PCrUZ4iI6BRV3Q+wWhvmE8oftOCuHH4A=
X-Google-Smtp-Source: AGHT+IG1t9g+PyWBTNNv9NJLqG0nvrC6oN7qO1dddwsct7J5ksa0J4Ge5ZLfMucYl6Syn9hATvxiLw==
X-Received: by 2002:a17:903:3bc8:b0:273:7d52:e510 with SMTP id d9443c01a7336-27cc79ca30cmr79439065ad.58.1758725021176;
        Wed, 24 Sep 2025 07:43:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdbf1c5sm2665309a91.19.2025.09.24.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:43:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:43:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Shane Fagan <mail@shanefagan.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-E GAMING
 WIFI
Message-ID: <12ab9197-8894-48e5-9d4b-4e516c3ae972@roeck-us.net>
References: <20250914074125.135656-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914074125.135656-1-eugene.shalygin@gmail.com>

On Sun, Sep 14, 2025 at 09:41:14AM +0200, Eugene Shalygin wrote:
> From: Shane Fagan <mail@shanefagan.com>
> 
> Add support for ROG STRIX X670E-E GAMING WIFI
> 
> Signed-off-by: Shane Fagan <mail@shanefagan.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.
Guenter

