Return-Path: <linux-doc+bounces-7110-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A8583356C
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jan 2024 18:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A451C216D3
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jan 2024 17:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE0F14A8B;
	Sat, 20 Jan 2024 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lU0cjhKv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779AA14A86
	for <linux-doc@vger.kernel.org>; Sat, 20 Jan 2024 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705770117; cv=none; b=R1lChV8gwI2C5dFYB9OC+/OEePTRXEGu/0JwnqWtTG3q75DrKd+JnaDAoabbVbdjB6vkEoIQkq3rUNe/EMAKwzQ3x8c6jqxWke0thjp35f9hViDAvhqpOQtd1asE0WCzAbWPTlU3xhaAZjC0P4QlmXoc5Q+zBtacOlmO7mj0IPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705770117; c=relaxed/simple;
	bh=M0N3JvZSRxhre+AHdg2DAWF69SvD6OJuhG0bltmzIpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FDLOu+zSZfzJNxqc/iLgcrhfxzOeItBLYbKIllUmrWatodVBu7ukuCswIBIEGzij4/AH9MqdsW7CRltA8+5YG2sCpBeplRQ4Fs94aXvlF5sjyFk7pUM5iwsqW3bGZNXuUdE2inAA3ftpMIZKNSrJQkf/4Dow+4O3uvGVULURX8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lU0cjhKv; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cdbc42f5efso182858a12.0
        for <linux-doc@vger.kernel.org>; Sat, 20 Jan 2024 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705770113; x=1706374913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8tEllDNlsEDP/jUaFTWEigyTJb7YjOR8aztDaSFSnA=;
        b=lU0cjhKviuPCNkyum783IabQBtofZGKZr9rytS6YlD6Qie33jroR872HS56OwoFQe7
         ETOPbCjdumfrZ4upqI/j/CN19AJ50ZzkEQwjCd2aExRekSqs0EVcEiqitqNbd0/aYobD
         hHE9zPJzTFvQAVklNWEDsLLM1ETke9QDRwNo49I5ntUGvJgxGOi7lUG0qn6ExAW9OlvI
         2ISj5dC1T7dfVRUcbuGtn857/1nqUNst835oRQgCTxZ2X7uhMeeI8Ww0rx8kpqDk7vNu
         y+zAd0MYNKMRdeDg6zOq8avVAj45kE4TgTm9V0T9jivEF0TCYIL5H0xt7tBelmhw1xlM
         IT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705770113; x=1706374913;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8tEllDNlsEDP/jUaFTWEigyTJb7YjOR8aztDaSFSnA=;
        b=uZX6T4jf8rfuAoc0CmwALNEDfBN+UnL0Hx91qtBsEoJzHuXmpzX3B0KpZDw8efcIib
         nB0tpUlvdpRbo4Su9B3MlQ4d0yUyzIv1eNceS+tp3jjX2EbbfpFgEw3tT2CDxMA6S12j
         iZNTEQYVMEHCvmsI+AKfgSZV77z/Y1TymRQxncrOKpJIjzbQGfP3lSHk6/z0fjTBtn/5
         2Hh1tcKU4BaizoLdu90GOuB+awwPs6uTa5tNIvObZnOJ2kUL4JFhLuhXK3Y35/7aCuZE
         KhkFF8+BfuHl+C8J8xUjQo3tnMPwSfSQ2UQBFo/+Itp8JjxM/2h6Wi68uZD6tLjJxevQ
         F5UA==
X-Gm-Message-State: AOJu0YyF3akcZ8LcetAeddUI/BnfsX973Gp+tmeiOYqKU9DB7nDmSExR
	LVjFiFj9MDPTtp29jbuzTrDGA9DvJmErPeCnSmrX/+YdZZplqBX3TmVjUTFap7k=
X-Google-Smtp-Source: AGHT+IFXh+gFqOHeoivxhaztHJcWCZc+b5GjJRb1wA9/OfMKsXYHRO7zmpHOEmQ1l+QFte51U8RP3Q==
X-Received: by 2002:a05:6a21:398f:b0:19b:20e9:90da with SMTP id ad15-20020a056a21398f00b0019b20e990damr5256618pzc.5.1705770113640;
        Sat, 20 Jan 2024 09:01:53 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id fi33-20020a056a0039a100b006d9aa6592d0sm6969907pfb.82.2024.01.20.09.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jan 2024 09:01:53 -0800 (PST)
Message-ID: <f48e47b5-0572-4f84-b165-5a9e91788c57@kernel.dk>
Date: Sat, 20 Jan 2024 10:01:51 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iouring:added boundary value check for io_uring_group
 systl
Content-Language: en-US
To: Subramanya Swamy <subramanya.swamy.linux@gmail.com>, corbet@lwn.net,
 jmoyer@redhat.com, asml.silence@gmail.com, akpm@linux-foundation.org,
 bhe@redhat.com, ribalda@chromium.org, rostedt@goodmis.org,
 sshegde@linux.vnet.ibm.com, alexghiti@rivosinc.com, matteorizzo@google.com,
 ardb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org
References: <20240120144411.2564-1-subramanya.swamy.linux@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240120144411.2564-1-subramanya.swamy.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/20/24 7:44 AM, Subramanya Swamy wrote:
> /proc/sys/kernel/io_uring_group takes gid as input
> added boundary value check to accept gid in range of
> 0<=gid<=4294967294 & Documentation is updated for same

This should have:

Fixes: 76d3ccecfa18 ("io_uring: add a sysctl to disable io_uring system-wide")

> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 6584a1f9bfe3..a8b61ab3e118 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -470,10 +470,8 @@ io_uring_group
>  ==============
>  
>  When io_uring_disabled is set to 1, a process must either be
> -privileged (CAP_SYS_ADMIN) or be in the io_uring_group group in order
> -to create an io_uring instance.  If io_uring_group is set to -1 (the
> -default), only processes with the CAP_SYS_ADMIN capability may create
> -io_uring instances.
> +privledged (CAP_SYS_ADMIN) or be in the io_uring_group group in order

privileged.

-- 
Jens Axboe


