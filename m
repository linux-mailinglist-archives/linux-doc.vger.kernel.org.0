Return-Path: <linux-doc+bounces-6892-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406C82F43C
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jan 2024 19:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C6661F24AA9
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jan 2024 18:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040BF1CD21;
	Tue, 16 Jan 2024 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZpMIyIZ5"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693351CD2A
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429733; cv=none; b=uAAnae4BqmUfqu1Fz7lg4X3gBjK19YId1izdqaiFBo2CL9ysshwsEV1U92IbkQDBUoO+y8tODIS3fc/c7C7Vpr6/YkwI79d3Z4HCoikLUe90mzs13nu6i4vRIsmRNmu/kjfEOazM4scZMmMpeFhmn7+AacretqgsaFbqUpH2UjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429733; c=relaxed/simple;
	bh=GygNfJAcz287WzdCvcBqvug1sLNSLaV1gwq53oFpFrU=;
	h=Received:DKIM-Filter:DKIM-Signature:From:To:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type; b=a68DxdwZtNY0smZonUKYg3c4U9s4c93z6KWtbRcyJrx+nMrGC/C/g2UD+XgDHqqCKi3d0LuLvTIB4Z49rmFqNsIelLkIUcj/sI09GrRdtYTzaXhCl9B+alWve9Cs1wxDurr0ByhWCd0DRmoGLFrenpoJWP6ivQYwkQY0YDlAajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZpMIyIZ5; arc=none smtp.client-ip=45.79.88.28
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3DF447A14;
	Tue, 16 Jan 2024 18:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3DF447A14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1705429731; bh=jC8kmSzYgkFOdXyDB/nbELNtkGsSheueRysmuS3p12g=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ZpMIyIZ53K13wYnj7vC5nZ6/H79VlyTnaqIRmcLF+0FW6V5DIBRkLWRwlU6F3GNKO
	 Yxx7PR6yKoE3co/k9LxIchRfLghKIaAJsjO19WXL1CAinv0hWM1RHr3eRTeEpRXjGg
	 66zRXhOk5Ey4c4QrbBGxd1wclx93XSI4+18Hj2/XDcxEW6/SXwRyVYzh9SSJFLsmaj
	 0cWXqdhelGqLkudcINrZQXy+BI5ITaD+fWSC4p+T8RtiP4UNZK/6GACJBt1C3ayrio
	 H1NyNc/cVZ6Zz5ho5plQxQj9fD16oFB2TGON6tPcnhCM8mkqrjv6Osf0nemfA6B9uk
	 MrFoJ2UF8GDaw==
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <878r4pxlnw.fsf@somnus>
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
 <878r4pxlnw.fsf@somnus>
Date: Tue, 16 Jan 2024 11:28:50 -0700
Message-ID: <87jzo9b09p.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> Hi Jon,
>
> Jonathan Corbet <corbet@lwn.net> writes:
>
>> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
>
>>> Another question: Is there an linux-doc irc channel to ask simple
>>> questions?
>>
>> I don't really do IRC, just don't have the spare attention span for it.
>> Feel free to email me anytime though.
>
> Thank you very much! So I directly use this to ask another questions :)
>
> When using the kernel-doc 'identifiers' option, is there a way to use
> wildcards or a easy way to enable wildcards? Something like this:
>
> .. kernel-doc:: include/linux/jiffies.h
>    :identifiers: time_*

Not currently.  That would be useful, though, and easy enough to add.
We just need to decide whether we want filename-glob matching, or proper
regexes...

Thanks,

jon

