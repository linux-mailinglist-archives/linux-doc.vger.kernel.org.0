Return-Path: <linux-doc+bounces-91495-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v6ccBjFCJ2oxuAIAu9opvQ
	(envelope-from <linux-doc+bounces-91495-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 00:29:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E2665AF74
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 00:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=X+Ecnwjk;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91495-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91495-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3163038AF5
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6090F3B27CF;
	Mon,  8 Jun 2026 22:25:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0613B14D0;
	Mon,  8 Jun 2026 22:24:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957500; cv=none; b=Kee2+kAsglSzTl8lUMAX7EFW+x686+iQcISCl0Tc4b6UX7hENtB1gzthFCb85nkQhWuCoSLhNETdCo5ImOZdeBj5mnxTgIQmZ8sWpB5yhFKXE1Frna6lm/mKd13TELrZyC6Kope8WfNAdww4Df5cF46YK2YVuIjRdHrafY+zhkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957500; c=relaxed/simple;
	bh=RujqqrWbjkdAFsXFMnqINKyZg8ETbccdJ4rLk6oLWHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e15znWMSPUjvt1s9nSNmQLtQ06QIKJXS6UDb0dEw6UwrRSgM7CpMeKWS5n5Ie1leLV3F4975kNcbju1zQJfmm22OudUJaucDlItI81HW7Not0wwRAhckDXNqvWR6mu8Nj8wivRXowIuyuzdmUCHyga+jEbaSyGWWkzcZAsN7Efw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+Ecnwjk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEA41F00893;
	Mon,  8 Jun 2026 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780957499;
	bh=KvXp+1P6AtbDNcD1+SpBwuR8V5/iTedBIFhFKp1j9iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X+EcnwjkPuRJ8wtgQyMIykB9IZbqA3iyPCCGBQlQIS6jFuRkpYm1AcZ+R6NMq8nVV
	 O+TXEs38C6ZO+x/YIvyDXyDm5EjVpaJ34k1+ijO7lbKpTogVyRkAzG0GkQCGVl+7Ze
	 eT3esN8W5BINCMiqg4VvIkNH/yGURLwUoJbo+lPzAvPHu52dctsA4lIbTRAQFcTSAK
	 c9uG9/eAZ5gcjQnzkhkqshtX4gp11jVeiKAC56wKE3M7sa/LehiexW20KrXcNOVehB
	 byueeGgPgynrOIvreLU9v9XHwn0nwFmnK/N/AO5kqtkK9/NeR5aZ1nXL6JBoq6lU9h
	 Tn0QeCn7l1Xbg==
From: Danilo Krummrich <dakr@kernel.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>,
	linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
Date: Tue,  9 Jun 2026 00:24:48 +0200
Message-ID: <20260608222448.1353773-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91495-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shashank.mahadasyam@sony.com,m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:alexander.shishkin@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:mike.leach@arm.com,m:leo.yan@arm.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:rahul.bukte@sony.com,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:linux-modules@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:sumitg@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,linuxfoundation.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,suse.com,atomlin.com,nvidia.com,sony.com,vger.kernel.org,lists.linaro.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65E2665AF74

On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/4] soc/tegra: cbb: Move driver registration from pure_initcall to core_initcall
      commit: cd6e95e7ab29
[2/4] kernel: param: initialize module_kset in a pure_initcall
      commit: c82dfce47833
[3/4] coresight: pass THIS_MODULE implicitly through a macro
      commit: efc22b3f89a3
[4/4] driver core: platform: set mod_name in driver registration
      commit: a7a7dc5c46a0

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

