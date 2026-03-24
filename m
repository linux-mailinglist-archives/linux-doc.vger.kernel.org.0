Return-Path: <linux-doc+bounces-80991-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHFnO9KpwmkyggQAu9opvQ
	(envelope-from <linux-doc+bounces-80991-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB2317C37
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E0CD304E25F
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 15:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5524035D7;
	Tue, 24 Mar 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkoNFeL5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37D402BAB;
	Tue, 24 Mar 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364780; cv=none; b=Vm7x/wmf03Ksujl2WiahseVhf5ixQmLPCviJ1/woZqti3cada9RT9gtXFIqhgOMVtqliTO2P24+k1u4i/dbhIssHep005Vgv+71FwzoZO7PGpFZg2geXJO3WAkiJ5/wTW+2NCWLbmKM4X/8ciV1T/Kz3MqdrUMoT7hrt9K3Re4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364780; c=relaxed/simple;
	bh=/Pkl3ERIJblGJmh1debS8MoBSBQPNjNn+kFUL0+4r1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwNcwJWjAXfqmaF2IjGHMmrKguYi2nvlkFq75Gn5Kxnkdmm8NxIvUtC01Bflicx5fEr/1MSygEj6i2U7L2DZLHcpTwRxTvSuDD8i4giGlUyKAqUG/P8JlfmDM6XQKexHfB5XQw0ew+EmD4O31GuZdaAJW1YH5g2pLHdtZnSN1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkoNFeL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9248C19424;
	Tue, 24 Mar 2026 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364779;
	bh=/Pkl3ERIJblGJmh1debS8MoBSBQPNjNn+kFUL0+4r1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TkoNFeL5OSZwqroED1E3mZnCVF17BldTgUOcIMJ9gcbPiwRAB4EtzOSUIWx5nryXX
	 qnfZVuEDVag22I/X4naqGRTn4WhV5oFRVNJanjPd4W060FtwUcR3dl011DkPF9Tt+c
	 hL0zOZ87HnFx7hJx3LqvvPr9X1xUoVL2SuLKrUXvLHezscyhg0uOLL6a99c0FFT9zF
	 RO6JvKIH2tHPifNhhRx1/HrTHcP+ERf0ytDi7J1OXUgutVwge+GLqJaWNz/zjrIDru
	 jv6kLSlhu7/0LHDmLNTWRc3HwoULFQvCSxJL4Rcul+qWVMdv6YHFr3jTMcr/zVMrTh
	 Ll9JYlWQbTBEw==
From: SeongJae Park <sj@kernel.org>
To: Cheng-Han Wu <hank20010209@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	corbet@lwn.net,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/admin-guide/mm/damon: fix 'parametrs' typo
Date: Tue, 24 Mar 2026 08:06:11 -0700
Message-ID: <20260324150611.92050-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324144851.12883-1-hank20010209@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80991-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCCB2317C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 22:48:51 +0800 Cheng-Han Wu <hank20010209@gmail.com> wrote:

> Fix the misspelling of "parametrs" as "parameters" in
> reclaim.rst and lru_sort.rst.

Thank you for finding and fixing these!

> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

