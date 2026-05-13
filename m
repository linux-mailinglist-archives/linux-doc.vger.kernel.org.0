Return-Path: <linux-doc+bounces-87283-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNbQOj8RBGoMDAIAu9opvQ
	(envelope-from <linux-doc+bounces-87283-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:50:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8352DC80
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C0E630C99E1
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 05:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC733AD52F;
	Wed, 13 May 2026 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEr57jV+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D423AD537;
	Wed, 13 May 2026 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651344; cv=none; b=u19KlAeZsYbAxqklXbHnFR5Wmmhrf7E1mIe7wSYP78EZ/ILRKWVojUyvatNug21wfahbJrQ5GCwqETY2Ubc4nW8LkDUPLmEOB1hBLsD0bot3jADmjtIa3xQMKuXiuG29/ljz7kx4N+PgHLd1qnyhVB51ah5pBeO4YIwG1wENarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651344; c=relaxed/simple;
	bh=ifGUREIRLqnGTTPM8kaAAvrKHhqu9/ZKzySc1LDobYA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AAbnPcId6U/HuP2nySMnHHaAnfYoo1jgFzyQlamgvH+nmuUUoa9LA3xoEo3isqDQg3/RSvAxZeEdeiV03yciJ9p5xKd24gSeQ/w5BOexvit2wui0GiiCWFSKCTuEemYn9JrrOQ+27ViTAnWeO0M/3JqZFT2NgVc7fe89HM4uza8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEr57jV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AE7C2BCB7;
	Wed, 13 May 2026 05:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651343;
	bh=ifGUREIRLqnGTTPM8kaAAvrKHhqu9/ZKzySc1LDobYA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KEr57jV+LJ0vbrtk7Og74TE3mAcm2caThYK+9hD0R0u5cz0FnEKZMP/N4d+cdYXra
	 old4eUo2ZSaq+jb2TzB5Y7trd+p5MSK3DVfoqz8D1J9uKi8Jybga6/iabvDTD9FV19
	 fIQTHdxDnGjT7LjTTN5j7w63LWB1jTA8q3wfL+GSZjdIpHLasa450/2+RgNZ77N4N/
	 W6PY2wxm1AOmIrlFUZOdApq1trHKXoOqJb5fCkw/pzRU5HpIQI/m2Ufv1CYQuUm7Ui
	 TQLj+H2Mf4o7pmu7nGY1anRX4aQUZGNJ1xI9Qb5XGzxsph0OcmwNmSBHcYDfE0Bq4f
	 simLqksdZDDSg==
Message-ID: <1477249318c68adc6f5e9dbca61aaddc@kernel.org>
Date: Wed, 13 May 2026 05:49:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v3 4/4] clk: test: convert constants to use HZ_PER_MHZ
In-Reply-To: <20260511-clk-docs-v3-4-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-4-ed67e1065809@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jonathan
 Corbet" <corbet@lwn.net>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: B5C8352DC80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-87283-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 21:35:07 -0400, Brian Masney wrote:
> Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

