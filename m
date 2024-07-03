Return-Path: <linux-doc+bounces-19990-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4299260D8
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 14:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C38FB25365
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 12:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0235417A593;
	Wed,  3 Jul 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7QCLfwU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C017A589
	for <linux-doc@vger.kernel.org>; Wed,  3 Jul 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010929; cv=none; b=Yr4+oqyTedfD+DBGbFLZEAw1Z01owYVcPQO3lLIc583AQpZZpXMEIbXvn5EGiP8mKHveZGJCgy0C5HnYIGtGiCXqTWZLTkBXgzsTQEL5H2+Z8MlJmG2bKNRZQwGVvF/kktqk/mM4hyKWUKXUCz9vi/ZOje0GQtr/AEAwZS1R33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010929; c=relaxed/simple;
	bh=nOrLYdaQKWbCBzur09331cdOZ260WekYtYvlyXlVvNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M+Cgjvyn6uPP+e4WuY8s29uwKQ9SDYtDPayAceugkQfCeOqaf1ieuJh8RoVRr9LF980gVhxAIoFdwpICPP7oI4S2yKmrufQ+umw8xTlRzbZSsRyEMzFbMGzi+249GLyPMrqk/sJGvQXuIAI1tV3+dikWeG/4GZNrYHogfGalunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7QCLfwU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720010927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2MEP5KBKlMKx9T4CmY7WwoI0xWCk7Wv3Ry4wWTTbIMQ=;
	b=P7QCLfwUcz3mg2A5ElG0ooCZzvadMZYJQAY+KS5kE9t26MDPBMjQjMeIVsODzCMY0DCEJe
	Ep41J0lxy3oVja+gVxtNGpFAqxAWuEZ+B4IoZ6kbPZ0+Ce8G1w7kNVvkv7sURdc29q/d8S
	McbqP4YFFDZhyIzrpg868ivJMZwIMfI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-DfQ4QL6pOcCW11TomgrN8g-1; Wed, 03 Jul 2024 08:48:46 -0400
X-MC-Unique: DfQ4QL6pOcCW11TomgrN8g-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ee890f0cecso2347391fa.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2024 05:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010924; x=1720615724;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MEP5KBKlMKx9T4CmY7WwoI0xWCk7Wv3Ry4wWTTbIMQ=;
        b=XxX7F2eaju701CEcCxHbPiH+9M4zoatqKjAfRqzTSH3bG6q8vDoOnzF4vk2l8aL2vN
         ZDagaUdkbL3rm6N+wyND3SozuP902uY5EW7iMn9C4wSp9/tJXMyUFqao3uTUskk1h0Lk
         mBAUtc+8g6i6Ab5L5djehW0HeY9IPXkncOn2NqDKXqDTXbNFDEqEO1qNsQAQn1UeWR5k
         16md+IfIhgU2zz5CXqhNtk+LnWrz7tg/6pQdBVyZ8l8X9eCgAE2z8Xrlijfc+MFPdHuz
         XYep4Pj9QLNN2rZyYenzjpq4h9TBHBD1wgOxj6z60UsY7sVwrsmv9v4HUHhVilloZI4k
         O6pw==
X-Forwarded-Encrypted: i=1; AJvYcCXDhzUXjyMD2ENG0tOANzn6aGKfvpLEjfpm2TNhGyawYPUsBqIpxsL/9hFGkL/cA7xabSDloQi3vCTYjPSqnY976O6uycBBimAB
X-Gm-Message-State: AOJu0YzVUwl16l60VPjpJy5o4Z27Fyx1thYjkts8usa8FZdUSN3sEYhv
	mJRVokBWIaM58mzLEsoZTcZSOHM+3tRzVzZdLNoYrQQnzJTk/My43rmvJDGr7hXemrR3mw7wTou
	O3SJUaNsD2YmQRyrYkER5axnzTA4hBtZkoHd7qmAl5chqdwH7dQMMwRz8Xg==
X-Received: by 2002:a2e:a7c2:0:b0:2ee:45f3:1d13 with SMTP id 38308e7fff4ca-2ee5e704e51mr78434021fa.47.1720010924681;
        Wed, 03 Jul 2024 05:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP5TqWKFAuIwTILcZtQfViw3L54aF8RKuLImctjrV+bIlLQQRnHKZJF7c8esvbcZCiclXd1w==
X-Received: by 2002:a2e:a7c2:0:b0:2ee:45f3:1d13 with SMTP id 38308e7fff4ca-2ee5e704e51mr78433691fa.47.1720010924256;
        Wed, 03 Jul 2024 05:48:44 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8cd8sm15773145f8f.27.2024.07.03.05.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:48:43 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, seanjc@google.com
Cc: pbonzini@redhat.com, seanjc@google.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-arch@vger.kernel.org,
 nsaenz@amazon.com, linux-trace-kernel@vger.kernel.org, graf@amazon.de,
 dwmw2@infradead.org, pdurrant@amazon.co.uk, mlevitsk@redhat.com,
 jgowans@amazon.com, corbet@lwn.net, decui@microsoft.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, amoorthy@google.com
Subject: Re: [PATCH 00/18] Introducing Core Building Blocks for Hyper-V VSM
 Emulation
In-Reply-To: <D2FTASL4CXLN.32GYJ8QZH4OCR@amazon.com>
References: <20240609154945.55332-1-nsaenz@amazon.com>
 <D2FTASL4CXLN.32GYJ8QZH4OCR@amazon.com>
Date: Wed, 03 Jul 2024 14:48:42 +0200
Message-ID: <87ikxm63px.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Saenz Julienne <nsaenz@amazon.com> writes:

> Hi Sean,
>
> On Sun Jun 9, 2024 at 3:49 PM UTC, Nicolas Saenz Julienne wrote:
>> This series introduces core KVM functionality necessary to emulate Hyper-V's
>> Virtual Secure Mode in a Virtual Machine Monitor (VMM).
>
> Just wanted to make sure the series is in your radar.
>

Not Sean here but I was planning to take a look at least at Hyper-V
parts of it next week.

-- 
Vitaly


