Return-Path: <linux-doc+bounces-24886-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9797372E
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 14:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB5B1C23F07
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1E8190492;
	Tue, 10 Sep 2024 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VwiH5bwk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7vnA5xGk"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924318F2D5;
	Tue, 10 Sep 2024 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971215; cv=none; b=l6OJT1e8xzGG7S1O4qR2vOQYHq6yebs6Z2pSiNC3p2BqWTgr7EnuzOnYwgb5lqWTeWQWfWbed430xItQ9I6kdRcYeNT15DgODZttngRSI36Qee5EmIXBp8VAt7mdtiZ+/8x+nbHSJS/T6RwkYWsu0iqipn68giBIeTRNbpxg6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971215; c=relaxed/simple;
	bh=eCxtRRUtCONF7YwhRWfZP98comlS1zguG2c64TB5SfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=APg++Y3DvwJNDjc3TltQx0v4AD6nrYDYsV+jJG9LinnXrBuyg9gLikR7BGIt8ybTVZ4epkWoonojUz9OOGGU1lNFGK5V60huN8am9XEQRVpbeH53+aGKPo2ytNyZ8aMUyw6+ZVvFNySWTWORgZQFT0LL/pK2EayTB1KR1GjGMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VwiH5bwk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7vnA5xGk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725971212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqeTKCQjOO2h+bjkR2b85aOCc2SbJBgvaCo9ECjf/bY=;
	b=VwiH5bwkROweDIARITZuAsl3kp9VcoL5Ut00iORY8SwNZJEwD8IIoY+aPQe5+ManZDWc7e
	y1pAGKavpLVPTLbDfBL+RQTnWYizhALaORV3njgDCdaWlqWqtBfEEC5v13kuQNngMJ60Pf
	9CDSZNwnbmH1oTmIZFjaNzJsx/RJg5ur8B0xp5QK2rPAPEKH5accBsigjgf+P6DID1QlZ0
	eyt1/IaUIyOooQMXGvVEYSQuRK6y0kNNZ0pkZNJnQ3Xo8pad/sJBWhrUGBZnOW1JSma8EM
	E5tjzOStKA03CqlsQqRfjtTltOYoXekWINze7tzzEqBnBqEtbKxcVReWtV2+GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725971212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqeTKCQjOO2h+bjkR2b85aOCc2SbJBgvaCo9ECjf/bY=;
	b=7vnA5xGkSUZY6Vq+jMkLy+hvRFzBJUdHShW+/XOu/mIRkNAXSWxVVTsBNkI3MqLdRe17go
	3p0uGQnqCNwa/9CQ==
To: Takahiro Itazuri <zulinx86@gmail.com>, linux-doc@vger.kernel.org,
 corbet@lwn.net
Cc: zulinx86@gmail.com, bp@alien8.de, jani.nikula@linux.intel.com,
 jpoimboe@kernel.org, linux-kernel@vger.kernel.org,
 pawan.kumar.gupta@linux.intel.com, peterz@infradead.org
Subject: Re: [PATCH v3] Documentation: Unify format for vuln sysfs
In-Reply-To: <20240908172341.571476-1-zulinx86@gmail.com>
References: <20240908172341.571476-1-zulinx86@gmail.com>
Date: Tue, 10 Sep 2024 14:26:51 +0200
Message-ID: <87wmjjae44.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Sep 08 2024 at 17:23, Takahiro Itazuri wrote:

> The format for vuln sysfs files was diverge across pages. Unifies the
> format as follows:

What is a vuln sysfs file?

Can we please avoid random acronyms and abbreviations in change logs?
There is enough space and it's not twatter.

Thanks

        tglx

