Return-Path: <linux-doc+bounces-96066-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hTYTBvXuT2qAqgIAu9opvQ
	(envelope-from <linux-doc+bounces-96066-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:56:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D0734A0B
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VpaG0lqU;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96066-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96066-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9CFF3094DC4
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 18:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4BE441611;
	Thu,  9 Jul 2026 18:42:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03C543F8BE;
	Thu,  9 Jul 2026 18:42:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622526; cv=none; b=TyBAhbQ1Z2aUxZX+IRRAEGzgon7GHKMAIl4Z61DGbwjuzZJRggDC6iSzCnUX3Mb/KIIVcEH+EY/xcYwos9kQm6t1JRTUrb+w84tk8uxA0xHhMXKWD/WmRSqL+t5MVkRWMxf1xZxPadLJKVelRrrAEiN2Az+8t7jSSKK48wPm8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622526; c=relaxed/simple;
	bh=3zzAFIxW4QntGIfc+v0S58ciMfKRPipxII9rhMorBnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BajwKwkCicZNqGFggSh5ej6E7a4bu+FiOroWiOxEQE1iIP5P59mHFGAv1vOd6LFWsr4ma/j6C77gMBNSBq7n++bJx3ZWZIt+9O7Br5ezA7mdNzOoH9Iko/h5zmFfqWu3ho3Zv6l3vVLSofwe+tRyJsMxdN2krPXAiso60bkNp1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpaG0lqU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6881A1F000E9;
	Thu,  9 Jul 2026 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622524;
	bh=V9/QBsgUl+YAHSU3KRVgzfp7o3z60FnCLy+stiPlLsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VpaG0lqUM9AJpjH5h2yYuDiybRa/XGorO8CR+46KxgKuXsP+ZlD24JnA3NGHjZSbj
	 VDvCQsTokNpbKimzr6UHWc03P9iPWK2n+WS4t+Zr5u22pU59ELlG79TDr+cbUMsAgd
	 pUdz/3yFvNgyufCzUqMngT9KXWls3TVQh3VCs0T7vvnXRF18wvfMAQZgF7ctMH31xC
	 CnQhN3Sufw/1roZvIvf7YDQsx++KToaYsk6AnqwtucyNGyPQ0p5NH4JCC1Zk6Bl9rd
	 O4Jwa0tz9/ePPoPCvda6A5nmR+LOLWWh+7doeeD+tYUkQJN0MON8RpOf/1cPHpqfQo
	 qRuhFLhq/s9iA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:47 +0100
Subject: [PATCH v12 26/29] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-26-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3zzAFIxW4QntGIfc+v0S58ciMfKRPipxII9rhMorBnU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r+KQ1zJ80C6wnIIVYlDY8xGooQpjWeJucoZ
 +qY2kBb6z+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q/gAKCRAk1otyXVSH
 0B3wB/9iWEG1cKGN60DbAJRUDX2lO5oQv99lWbCu882DlgSdoN82JGfBtU6ZnDJi8u/469CrkMR
 kRO/PhUMi4/+Tpwxs6LT8Fw5NgV+aWwsDvJ8vBYyHmOuhX1pBYRpyP1V5+K5cYWkEcRLLBxmVh0
 cs+tpR+QhvQ06Qznczflff9hA13XAsyZIQ+tPnj0oSEfka3mTIOBYnq4JbuJVJlaCgNg3UHtNFj
 HgP8Zry8wOJ4BNQvN5BaZQNzHQxGo7QyqfYu2YgkkcDgO2yDBKYN/Seg75MJG2mKErHBsjUfOnd
 QqbduqIMjyKkJRifjaYRXWPUY/EU3Mb/IKHovBkzYlwG0uUX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:joey.gouly@arm.com,m:catalin.marinas@arm.com,m:suzuki.poulose@arm.com,m:will@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:oupton@kernel.org,m:Dave.Martin@arm.com,m:tabba@google.com,m:mark.rutland@arm.com,m:ben.horgan@arm.com,m:jpb@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:peter.maydell@linaro.org,m:eric.auger@redhat.com,m:broonie@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-96066-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C7D0734A0B

get_safe_value() currently asserts that bitfields it is generating a safe
value for must be more than one bit wide but in actual fact it should
always be possible to generate a safe value to write to a bitfield even if
it is just the current value and the function correctly handles that.
Remove the assert.

Fixes: bf09ee918053e ("KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user")
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..9eceac84e297 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -279,8 +279,6 @@ u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 {
 	u64 ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
-
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:

-- 
2.47.3


