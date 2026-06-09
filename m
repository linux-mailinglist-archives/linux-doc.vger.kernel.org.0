Return-Path: <linux-doc+bounces-91753-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ob6fEByoKGqgHQMAu9opvQ
	(envelope-from <linux-doc+bounces-91753-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:56:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11F664DBC
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GfeFuMrQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91753-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91753-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6802530046B5
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 23:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDCE3EBF0C;
	Tue,  9 Jun 2026 23:56:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CB3CFF56;
	Tue,  9 Jun 2026 23:56:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049366; cv=none; b=P6bvgyKPB60N5lGs6Fhtrx/PWxO9kMO8+u/5mhsJA4VjJk/yErhHz4cvHe90UrxJS50SENn46jkESare/r8Q7DM+X/tqEGMyv7YT1jg0cnglClNAlbwTGkF2lu56/iiIJJfnc4kzCAQiYmZBv9tKQ4xq38XHffc4BOBlKwMFr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049366; c=relaxed/simple;
	bh=ivBgzWvravhZdDLyD7LukCd2Bu6awTYjolYyPt2hDq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agODoDKF8IHDBHNLMT7MKH3rpX9Igqp1s48RCDDzmeHsOYzYYJxm4nuccjZCgsAJgDtJ18BjOmAfUfhjTZb+x16lUFqzrr8Csr1OEHmfvgrMOGsUrIngl/VTCGl+lHuL+nTvHSYMFWYAqaluVZOKFl84vfxeVLhq252Pg1izHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfeFuMrQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09B01F00893;
	Tue,  9 Jun 2026 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781049365;
	bh=CqTDLJlr+PvJWmHo6xti7Q61COtf52VcvmEIeE8PPxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GfeFuMrQeHtAJ0O1r+EgeFD8C+04SN/7/OkJjmq3AiKIOh+vZ8kff8djlgSrlJ2s/
	 l2kOga0lGu8UNtR6TuGhChemWVaH68vjwer/JbO3Qx55m83wJm5VFoDD/CwTSO7PhW
	 S1ZGZqCOAzch+k3DX/z+W2JlZ2weKvI4549v4RpukkuMAFPR7dT82zTituN0i8vyP+
	 wt9IBamdRJFf0E6twqZYW7QzVvD138vmbwBXzjAGAxr4CIauHJaU/gu/PlHbobjGoa
	 5dn2hqCTuCx9aWpVzLV2q/QVxCFqe36zBgeyEM1DoBmswyYOEYXNEQcUIfVke0QidY
	 M14HlrF/DgQ5Q==
From: SeongJae Park <sj@kernel.org>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	damon@lists.linux.dev
Subject: Re: [PATCH v4 0/2] docs/mm/damon: fix docs and update zh_CN
Date: Tue,  9 Jun 2026 16:55:55 -0700
Message-ID: <20260609235556.73472-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781015560.git.doehyunbaek@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91753-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:sj@kernel.org,m:dzm91@hust.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:2023002089@link.tyut.edu.cn,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:damon@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A11F664DBC

Hello Doehyun,

On Tue,  9 Jun 2026 14:34:24 +0000 Doehyun Baek <doehyunbaek@gmail.com> wrote:

> First of all, thank you very much, Dongliang, for your time and
> dedication in reviewing the previous versions.
> 
> This v4 sends the original English DAMON documentation fixes as the
> first patch, and the Simplified Chinese translation update as the
> second patch.
> 
> For zh_CN, I translated the current DAMON usage.rst paragraph by
> paragraph, and added missing pieces such as stat.rst and the related
> index/design references.  The zh_TW changes from earlier versions are
> dropped from this series.

Thank you for sharing this patch series!  However, to my understanding, the
path to the mainline for English documents and Chinese documents are different.
Sending patches for English document and Chinese document as one series is
therefore making it complicated, in my opinion.  Could you please rebase
English document part to mm-new [1] and send as a separate patch?

[1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees


Thanks,
SJ

[...]

