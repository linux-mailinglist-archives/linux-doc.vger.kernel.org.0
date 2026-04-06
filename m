Return-Path: <linux-doc+bounces-82601-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JULO6ob1GnHrAcAu9opvQ
	(envelope-from <linux-doc+bounces-82601-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 22:46:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 752AD3A74D9
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 22:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CE1430A88D0
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2026 20:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062253264C7;
	Mon,  6 Apr 2026 20:41:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E631194C;
	Mon,  6 Apr 2026 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508118; cv=none; b=SREd/ETHAQzGM0RAuSRU0DTFOTvIwAcqUs1ufm4Quv8fwDFZXAmEkQfEfiC+oJy/eND4eLCp01n67jVCCDVYWgt4lENfmwx0dio3SPZ/f79OT4lu/W3vSYo0NpR8kPL/HbcOq3QxsCHpA0D1N0OtNlH+HsIzOH7Q8fIgl/6vig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508118; c=relaxed/simple;
	bh=W0B/UsJh7cDhEz2qfiBn1YmmvZsK7rvyBsJhREkE2uA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gdluuYGM4E+5me7HL9i2AA7H6Vm65M5gT3Netxv5eGKaIZ4BoptPgaRhPC+68GKdmbU8Fun7CtQrkdaIRfimF2T2vX7VI7PWzK0Oe8usm4JfpgcDmqlCzHq/Kz09PoB1c/VlU2LfkD5Bwd7ZCIY8ETPe1IwDUwScIhS8YKkzgPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A31DD553DF;
	Mon,  6 Apr 2026 20:41:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 1A87E2002F;
	Mon,  6 Apr 2026 20:41:52 +0000 (UTC)
Message-ID: <646163fbd76af208762fce6953b03ec84ffdd19a.camel@perches.com>
Subject: Re: [PATCH] checkpatch: add --json output mode
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, dwaipayanray1@gmail.com, 
	lukas.bulwahn@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Apr 2026 13:41:52 -0700
In-Reply-To: <20260406170039.4034716-1-sashal@kernel.org>
References: <20260406170039.4034716-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 5ngqw7gmuzy4icgu8ik85ko4zqyqdnrz
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18uRIy8J4/OSa6ZhttYe/dtz6NQ8BvJ+Y4=
X-HE-Tag: 1775508112-956861
X-HE-Meta: U2FsdGVkX1+UewXBuZ09Y6wfnjR8r29Z3Y+s+b6BOtJMZ8eaQAg8cQNxsvkTTifM4SqbxWBZAXQzYKtRpoI2tnYD6AcQ/ne3+4zqcMmWpbtmsvIclaoecsJbAV7oIb5DE/x81j6DedaL383r9Xq3ElnWSH4CsTJ31pki1GyJFQ2YHS1YKILQX20+yi2xWKcCuFiWXMQ1QnyCEukLuOPsc+fC+VjDpT3bOqD+GoIkesXywb/Y/n3L8OJxwj2zhp2IVCLqVC/P+yFynPKLGmdU7YNcpTVUzx/VQzn1DEmEOp1ufWpbzwtwcITwAM/wgXAr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82601-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[perches.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.773];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perches.com:mid,checkpatch.pl:url]
X-Rspamd-Queue-Id: 752AD3A74D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-04-06 at 13:00 -0400, Sasha Levin wrote:
> Add a --json flag to checkpatch.pl that emits structured JSON output,
> making results machine-parseable for CI systems, IDE integrations, and
> AI-assisted code review tools.

Seems a reasonable idea but perhaps can be improved

> @@ -1372,7 +1376,7 @@ for my $filename (@ARGV) {
>  	$file =3D $oldfile if ($is_git_file);
>  }
> =20
> -if (!$quiet) {
> +if (!$quiet && !$json) {
>  	hash_show_words(\%use_type, "Used");
>  	hash_show_words(\%ignore_type, "Ignored");

Maybe keep but update?

> @@ -7791,18 +7836,33 @@ sub process {
>  	# If we have no input at all, then there is nothing to report on
>  	# so just keep quiet.
>  	if ($#rawlines =3D=3D -1) {
> +		if ($json) {
> +			print '{"filename":"' . json_escape($filename) .
> +			      '","total_errors":0,"total_warnings":0,' .

poor formatting for that trailing ".  please separate by content blocks.

> +			      '"total_checks":0,"total_lines":0,"issues":[]}' . "\n";
> +		}

I'd prefer to keep the print() style used elsewhere
and perhaps the JSON:PP module should be used here.

