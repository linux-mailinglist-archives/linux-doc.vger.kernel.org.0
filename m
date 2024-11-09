Return-Path: <linux-doc+bounces-30364-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EC29C29A4
	for <lists+linux-doc@lfdr.de>; Sat,  9 Nov 2024 04:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AB75283AB9
	for <lists+linux-doc@lfdr.de>; Sat,  9 Nov 2024 03:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9402E401;
	Sat,  9 Nov 2024 03:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="CuTvR9qC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD96A8D2;
	Sat,  9 Nov 2024 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731121817; cv=none; b=ElQaRIGZD87crdtbrLdZav8oCmMdi3M8M2SNRc40A/4Tf7i7cY8s3Keu+diXIqA6i5gmvt6Pon3r71+c8M6tuPTPR0qBMc5/0PwPjlN5htM6CqvV/5iCub8GFywptizFc6gwTboHl2obi40g9lUEC6sU+PwogSbRNblXouEK9tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731121817; c=relaxed/simple;
	bh=wye8iv6GBUqV4RPPtL9lLvmKw7jZ1JuvjzMoEbBOM9I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=NDPyVxgT7wPUYHGLMQbg1JSb9+h+tQkfiJZsk9F087HpfWlrJ5XmvDtrIye+E3UeOuWZuRWFBCJxWITABbB3eFnQFP/6ZXtQBAm+IZUqjnNNJk/6YCAvYJHKzP5CAAyOk7EljPTUAa6IBjG6KA52IUF90Ow4FC8UmfE4jK+xe68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=CuTvR9qC; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731121812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3cjnRRWgeotFHH4xSamuV9Ko4ExVM2WbLvuwDlVztQ=;
	b=CuTvR9qCXexvU5xxshnqYneebcIOmWZdoRFWurnOhbmvAvolA7/N8McvUm4bU96NurxlTb
	/We9NJrTckaXUNBvr8MQYXii2VyQde1w0/C8A03sNFlRvu/4wBxHMmYcCNuk5cC/Oqg5GB
	c/OQRqdqOpNz4wig9M8XOZTXc2teQbnuvXWthVcX9u4KhGNem9zlRBdrETmo9qEdWlL2Im
	SkV7pdQiXu7jqK2yHMTEs3LhuLQfA4bK+iAQ57/j6fhlqK5vYaZw28IYiL/vEHa5c4Q01S
	hMMO8kCeVMZdRCzP4xji1GGzNrWViEtz7TY4hOU7UqrdlEOiqRKzYzZaJGMl2A==
Date: Sat, 09 Nov 2024 04:10:11 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, wens@csie.org
Subject: Re: [PATCH v2 0/3] Make Helped-by tag supported
In-Reply-To: <672e628111eb0_10bc629436@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.1730874296.git.dsimic@manjaro.org>
 <87h68k4esb.fsf@trenco.lwn.net>
 <cabfa180845df30bfb7a541a701a57e9@manjaro.org>
 <672e628111eb0_10bc629436@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <28c0a0ecc2e2880e4cb98449767e2842@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Dan,

On 2024-11-08 20:12, Dan Williams wrote:
> Dragan Simic wrote:
>> I'm fully aware that we may be reluctant to supporting additional 
>> tags,
>> because we may then end up with a whole bunch of strange tags that 
>> might
>> be a bit hard to understand and use properly, but I think that adding
>> Helped-by to the supported tag list may actually be a good thing to 
>> do.
>> As described above, Helped-by fits very well between the Suggested-by
>> tag and the Co-developed-by + Signed-off-by pair of tags, and I think
>> that providing the right level of attribution may be beneficial.
> 
> Patch attribution is separate from giving thanks. I would much rather
> someone take the time to say "Thanks" in the changelog with some
> supporting text rather than boil down all the myriad ways to be 
> thankful
> into a generic tag. "git log --grep=Thanks" often yields valuable
> details, beyond just attribution, on how people have helped each other
> develop this global project of ours. If the introduction of Helped-by
> would replace even one authentic "Thank you" note with a generic tag
> then it is a net loss for the community.

I do agree that writing "Thanks John for helping with..." in a patch
description would be nice, but unfortunately I've seen multiple times
that people don't enjoy writing their patch descriptions at all, and
just want to "get them out the door" as quickly as possible.

With that in mind, making Helped-by tags supported would allow such
people to at least quickly mention someone they're thankful to, which
actually wouldn't prevent anyone from saying the same more verbosely
in a patch description.

