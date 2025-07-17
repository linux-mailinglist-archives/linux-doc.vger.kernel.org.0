Return-Path: <linux-doc+bounces-53330-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67422B08A78
	for <lists+linux-doc@lfdr.de>; Thu, 17 Jul 2025 12:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C8F566083
	for <lists+linux-doc@lfdr.de>; Thu, 17 Jul 2025 10:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE1328FFE6;
	Thu, 17 Jul 2025 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ft8rGHTr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186961C84DF
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748057; cv=none; b=S2b/V7Ty2sXv8RTPbf3SOdIddkroF2HmcBrqtsaQaHf5tnT4PIS5idEOsktwVOs1TYlneVZ8ErXUPBRSPrJqas5YBX49eDVnLHPwp3bc8g2QFPw56bfKwEPt/SxLg7HwJ1yQROWEpIKarG+zG2RXbk3JHDIFeV7CMq9Mb7qOyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748057; c=relaxed/simple;
	bh=IFQcRoS40z/KdpYplMG/Rnknz5otB91TkOE2Ys9zfIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRyEMmzg9OoeI87D/nq3gLiDzYteDCYlDQoksIzk3m6Mq6VMKkzsWD7exH1rrlH/fLnzpDdbPDVB2x5b8MVj0Sc+IrxOmMbrRArrXBA8ky8BwWWdK/ytKWkKvLnTx/+aprliSimLVeMswO0Mhj0fPcnU/qjyYh9LRomt+TLIedA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ft8rGHTr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a528243636so494086f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 03:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752748053; x=1753352853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tie25ahngtfYozMeErJjzJKzu3NgX/BGsiimS9pCH3Q=;
        b=ft8rGHTrFByIymErok0USB+V5C5afv3qpUatFsZT0NwCrAb/XwqL/jLlPExpZyaKeY
         gwtNIjC5rKzd7/LDtChQUsU/mpjuaFGOtR+nmw7ozGwRrbJmYgC0V3KRcTB2H5061wIp
         gz+exTOJQxoLyVIpVlQgfX9MW+waoJiGmfcYOru0mS3lL2gaTZz/lRG6Qa9a8JEC+nHW
         +cEbQ3ZDg5r9Vgk+6NxpQams5uyRJgIqfF5jPNuy7774H/15liFLcD0f20CKvAEYmvox
         D6Eydc4pXP7zdOWffWd737CSDD5BwP6NhaTwsQApnv8NAIxWVNXGphU4Jd24YBQENyhM
         iIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748053; x=1753352853;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tie25ahngtfYozMeErJjzJKzu3NgX/BGsiimS9pCH3Q=;
        b=myNp1sY3OCAfugfJ1Etf1j7NijYnJcrmkHzzZCjWrYICFj8WomlacplI2drSUGGZAL
         BTdPQNeg/TESPm8A2Fvvdb5W5W+crbkKJsINtWEXAr2eBW98CL6mX1S3cj/4112zJzmA
         EeEB0GSxP4At3hu8u0j234QTXWdUnkutUKOCtu/18XJ3e4gPCZHQJCa0zs7YkPBakVhi
         CONDEzb9C1f4mz41T0xauETgjafxTJQcmOn7ltH7fxJYhm4uw4auYybG8BzZf4VAGjjn
         TjLRXOefAW661YMgHTmCZa7viLUzeg4GNrXLb5iBc6hjChwLQTNTj7MMh4uEdQEuTLOq
         cwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYsXXW1C1ymGxY3Olnam9DFKuZWQ4W3AXHdSlqp7tPW6i4FR28npFY1QhWTNzCl+bXN0TpCgmwPqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+QOcxwi9wWITlR5KIt3FXGs39tdUySDvmxXrDf2Yi8HLjB8b
	mkAfDgT/WUb2RkjHXVAr75yZl3zZMJl5NvWDWjfLlLBDzPxKspQfHNwRJXEz9/17teY=
X-Gm-Gg: ASbGncvnDq2NnB3t71mZxx7HdPHJpraoZi+Fo+V+8RsdtzFr3v7UG9e/A+OpDjIA5Ip
	ziKOrgjpJs2uY/RzyHc772lQnJ4JkH+ZJyAGl/YHfT0bXRZhkH/8LF8evwDqZGOo7sRCwfTILyO
	V+VXZ3haCyl+pmAmgiMMtS/SmFbPMEuizVZ+cIPfmJEC7edHzmsDeDQuXLEFN++DuwNzzQYYxXI
	dJKtFm122cUysR5D7VXD022bMvqtDOzMfBkzye8PQwcRGp7AJr9dCbSDHceX1jmvsJMvbRV8zey
	fgmHFDAxFFwnSSk8IKQ6O1VjJCba0q5ajTRVfv8IPCDTa9otXixY/hRO5fm1gfiHGvK3wqFDAUu
	yNQSTwrG8b3RBvR4YDSMTA94sgg==
X-Google-Smtp-Source: AGHT+IERXsLgfOwcddXT3ncp4XpdwObpfPX4q7D341/fTbrh2ntUdV1/4fXpqEa2cD9tDvB0w4QSMQ==
X-Received: by 2002:a05:6000:43d4:10b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b60dd7aa83mr3719533f8f.30.1752748053321;
        Thu, 17 Jul 2025 03:27:33 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.209.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-456278ab486sm61237325e9.1.2025.07.17.03.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:27:33 -0700 (PDT)
Message-ID: <0b85f378-221b-408e-865b-b4eab675a351@suse.com>
Date: Thu, 17 Jul 2025 13:27:30 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: document linked lists
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250714-linked-list-docs-v3-1-56c461580866@collabora.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20250714-linked-list-docs-v3-1-56c461580866@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.07.25 г. 11:14 ч., Nicolas Frattaroli wrote:
<snip>
> +In State 1, we arrive at the following situation::
> +
> +        .-----------------------------------------------------.
> +        |                                                     |
> +        v                                                     |
> +    .--------.     .-------.     .---------.     .---------.  |
> +    | clowns |---->| Grock |---->| Dimitri |---->| Alfredo |--'
> +    '--------'     '-------'     '---------'     '---------'
> +
> +          .-------------------------------.
> +          v                               |
> +    .----------.     .-----.     .-----.  |
> +    | sidewalk |---->| Pic |---->| Pio |--'
> +    '----------'     '-----'     '-----'
> +
> +In State 2, after we've moved Dimitri to the tail of sidewalk, the situation
> +changes as follows::
> +
> +        .-------------------------------------.
> +        |                                     |
> +        v                                     |
> +    .--------.     .-------.     .---------.  |
> +    | clowns |---->| Grock |---->| Alfredo |--'
> +    '--------'     '-------'     '---------'
> +
> +          .-----------------------------------------------.
> +          v                                               |
> +    .----------.     .-----.     .-----.     .---------.  |
> +    | sidewalk |---->| Pic |---->| Pio |---->| Dimitri |--'
> +    '----------'     '-----'     '-----'     '---------'
> +
> +As long as the source and destination list head are part of the same list, we
> +can also efficiently bulk move a segment of the list to the tail end of the
> +list. We continue the previous example by adding a list_bulk_move_tail() after
> +State 2, moving Pic and Pio to the tail end of the sidewalk list.
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_exit_car(struct circus_priv *circus)
> +  {
> +          struct list_head sidewalk = LIST_HEAD_INIT(sidewalk);
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct clown_car *car = &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          /* State 0 */
> +
> +          list_move(&pic->node, &sidewalk);
> +
> +          /* State 1 */
> +
> +          list_move_tail(&dimitri->node, &sidewalk);
> +
> +          /* State 2 */

Nit: I think it's unnecessary to repeat the initilization in code since 
you've already explicitly mentioned you continue form State 2 of the 
previous example, so the only salient information is the additional 
list_bulk_move_tail call.
> +
> +          list_bulk_move_tail(&sidewalk, &pic->node, &pio->node);
> +
> +          /* State 3 */
> +  }
> +
> +For the sake of brevity, only the altered "sidewalk" list at State 3 is depicted
> +in the following diagram::
> +
> +          .-----------------------------------------------.
> +          v                                               |
> +    .----------.     .---------.     .-----.     .-----.  |
> +    | sidewalk |---->| Dimitri |---->| Pic |---->| Pio |--'
> +    '----------'     '---------'     '-----'     '-----'
> +
> +Do note that list_bulk_move_tail() does not do any checking as to whether all
> +three supplied ``struct list_head *`` parameters really do belong to the same
> +list. If you use it outside the constraints the documentation gives, then the
> +result is a matter between you and the implementation.

The last part of the sentence can be simplified to just state the result 
is undefined.

<snip>

> +
> +Splicing two lists together
> +---------------------------
> +
> +Say we have two lists, in the following example one represented by a list head
> +we call "knie" and one we call "stey". In a hypothetical circus acquisition,
> +the two list of clowns should be spliced together. The following is our
> +situation in "State 0"::
> +
> +        .-----------------------------------------.
> +        |                                         |
> +        v                                         |
> +    .------.   .-------.   .---------.   .-----.  |
> +    | knie |-->| Grock |-->| Dimitri |-->| Pic |--'
> +    '------'   '-------'   '---------'   '-----'
> +
> +        .-----------------------------.
> +        v                             |
> +    .------.   .---------.   .-----.  |
> +    | stey |-->| Alfredo |-->| Pio |--'
> +    '------'   '---------'   '-----'
> +
> +The function to splice these two lists together is list_splice(). Our example
> +code is as follows:
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_splice(void)
> +  {
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct list_head knie = LIST_HEAD_INIT(knie);
> +          struct list_head stey = LIST_HEAD_INIT(stey);
> +
> +          /* ... Clown allocation and initialization here ... */
> +
> +          list_add_tail(&grock->node, &knie);
> +          list_add_tail(&dimitri->node, &knie);
> +          list_add_tail(&pic->node, &knie);

nit: Might add a new line to make it more visually clear that you are 
adding nodes to different lists.

> +          list_add_tail(&alfredo->node, &stey);
> +          list_add_tail(&pio->node, &stey);
> +
> +          /* State 0 */
> +
> +          list_splice(&stey, &dimitri->node);
> +
> +          /* State 1 */
> +  }
> +
> +The list_splice() call here adds all the entries in ``stey`` to the list
> +``dimitri``'s ``node`` list_head is in, after the ``node`` of ``dimitri``. A
> +somewhat surprising diagram of the resulting "State 1" follows::
> +
> +        .-----------------------------------------------------------------.
> +        |                                                                 |
> +        v                                                                 |
> +    .------.   .-------.   .---------.   .---------.   .-----.   .-----.  |
> +    | knie |-->| Grock |-->| Dimitri |-->| Alfredo |-->| Pio |-->| Pic |--'
> +    '------'   '-------'   '---------'   '---------'   '-----'   '-----'
> +                                              ^
> +              .-------------------------------'
> +              |
> +    .------.  |
> +    | stey |--'
> +    '------'
> +
> +Traversing the ``stey`` list no longer results in correct behavior. A call of
> +list_for_each() on ``stey`` results in an infinite loop, as it never returns
> +back to the ``stey`` list head.
> +
> +This is because list_splice() did not reinitialize the list_head it took
> +entries from, leaving its pointer pointing into what is now a different list.
> +
> +If we want to avoid this situation, list_splice_init() can be used. It does the
> +same thing as list_splice(), except reinitalizes the donor list_head after the
> +transplant.
> +
> +Concurrency considerations
> +--------------------------
> +
> +Concurrent access and modification of a list needs to be protected with a lock
> +in most cases. Alternatively and preferably, one may use the RCU primitives for
> +lists in read-mostly use-cases, where read accesses to the list are common but
> +modifications to the list less so. See Documentation/RCU/listRCU.rst for more
> +details.
> +
> +Further reading
> +---------------
> +
> +* `How does the kernel implements Linked Lists? - KernelNewbies <https://kernelnewbies.org/FAQ/LinkedLists>`_
> +
> +Full List API
> +=============
> +
> +.. kernel-doc:: include/linux/list.h
> +   :internal:
> 
> ---
> base-commit: f55b3ca3cf1d1652c4b3481b671940461331d69f
> change-id: 20250520-linked-list-docs-ce5b956d4602
> 
> Best regards,


One suggestion, how about adding O() complexity of the documented 
functions.

