Return-Path: <linux-doc+bounces-85700-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE/oOfHL+Gma0wIAu9opvQ
	(envelope-from <linux-doc+bounces-85700-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 18:40:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6314C185C
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 18:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CDDE302C6E4
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E653E3C5B;
	Mon,  4 May 2026 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYxGvOeU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A433E3C5A;
	Mon,  4 May 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912743; cv=none; b=MNSitB1EpItZp1kA523mI/LOrBdHEXMsyJGt1qKgK688tskiHLtssgBGS8XLKhghvDk1HkAkoT7o18lFJ/S8NHhoOvD0OTnEdnAGgknrtrBH/jcpubwaYPpDpCET3SVzYkEzmNVIwhUCOVbnO32u+sxhMWFZg+xo+oiPY5wCx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912743; c=relaxed/simple;
	bh=njr0GWE4Oza+aeDGFeb0WZSg+lk1gG64Ezr4eSCWKZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHhk8rrSW/sMEa69tT8A3iHv1JKtPH4HE/Qw4kdALjSQgjfKA0bDrItSvxIAR2MLSa/cM7Sm/uZ9WVezUHC6p0BJ5Z82AD8Q0NT6W/vfmD2KC9KDr2qhm6RwnsCRl1l+8+H4ayDu/SQd/FfyeKWQ3lP1D/wtYAb8cFdT5jmqjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYxGvOeU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44597C2BCB8;
	Mon,  4 May 2026 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777912743;
	bh=njr0GWE4Oza+aeDGFeb0WZSg+lk1gG64Ezr4eSCWKZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rYxGvOeU9CG6ZQ0Nw50knmT9mQvraeVTMTvePSZrWytNkaflIfJ4agF/2CgGrcb5a
	 TP1scsnN6yDryv15UEkXjX4Ebq1LQcMvhgzf5gaad29OUiG0oUUc4czois8EXbS00D
	 tz1nIN+cTg2zSwJXmbdteu0hjeEBTFktvLqXlRALQAfcLX/xch+E0weRngTlxnpIoA
	 Gibvi8BasyHBTHZmFVQL7JPQq0M4IuG2xpRzShnlauoB3mMr7p4gSsRxiNlFFIXpp6
	 jPO6KNxu5EoxP2QTG9hrGYcRimAbLAPHRdpDIQQmz8HlKcvli5Yj/RSN6Cc13H0PMq
	 aZKLx7kP4sK6A==
Date: Mon, 4 May 2026 17:38:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Wang Zihan <jiyu03@qq.com>
Cc: joshua.crofts1@gmail.com, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] iio: adxl313: fix typos in documentation
Message-ID: <20260504173855.1407e7d3@jic23-huawei>
In-Reply-To: <tencent_5E6677A3FFCB969503EE5250592E75128807@qq.com>
References: <tencent_5E6677A3FFCB969503EE5250592E75128807@qq.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7C6314C185C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	TAGGED_FROM(0.00)[bounces-85700-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:email]

On Sat,  2 May 2026 20:53:43 +0800
Wang Zihan <jiyu03@qq.com> wrote:

> Hi Joshua,
> 
> Thank you for the review!
> 
> I apologize for the quick v2. The v1 had an incorrect subject format
> ([PATCH 1/4] instead of [PATCH]) which could cause confusion. I sent
> v2 to correct this formatting issue.

Make sure you include a change log below the ---
That would have let Joshua and the rest of us know why you resent.
Particularly important when doing a quick resend.

Thanks,

Jonathan

> 
> I will keep the 24-hour rule in mind for future submissions.
> 
> Best regards,
> Wang Zihan
> 


