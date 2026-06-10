Return-Path: <linux-doc+bounces-91788-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A7mWAE/iKGqQLgMAu9opvQ
	(envelope-from <linux-doc+bounces-91788-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 06:04:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E6665B19
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 06:04:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="e/+gZdUF";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91788-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91788-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F252E307D409
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E5F33C52F;
	Wed, 10 Jun 2026 04:04:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30F7E792
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 04:04:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781064268; cv=pass; b=D6gjzZUSd26OiPcdRhphNV3bnFzD9dWRzqIRJIkeSl+7PBsnhiD/cI30vv94OVcVmoPH9j09VFUU7b1JBw110Z/ib2ICFnObTH47MMzRAANi74d6o9EAkTCgXhzJmM1x6R2+0W9DKq6DWC0Z/wS2ECQE3ay33NuA+mQ63+YAAc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781064268; c=relaxed/simple;
	bh=ziLSvpDPefhMh1YLhfgYvQRoU+jpwrEU6vRhvYQI4WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+zfyFm7Lup4IbH49+KCkO7z1rBgUKbx1kKUsW19DxWLgg0Du9w1TCDltELR7IAC1ZGfulfhmt1+EgrdL9MhdTlvRldCu4xBtsCalvZbbJknC9wB9lEEm4/3o9g3XwOlULQeJ77NckREZ1wffe271NDBjPb+rFOQHgh9ri60alY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/+gZdUF; arc=pass smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51784eb2ba0so47827711cf.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 21:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781064266; cv=none;
        d=google.com; s=arc-20240605;
        b=OT+4mfeND8H/FwrK30gE3FT/OGQhIEKwFcGO/q3rgHiZs0VqPZLgurDjKk0RUEJpcS
         2OyyR5GkibduSvCeGwpA7BQl6QyqpDzlRkAvp3hTOysaDzm4OnjEOU4IMrmnY4SV5A3l
         0cDjbTCi+ctFgFqzWzMyAH/JbGzMaT6b/v7a9GIYA3EeUTFW2YCjuk5fah5zwtLW40k7
         MSpFdnLz7uOB9fB/GnOku1GVjLqBb1a1mrZiz4vGFsD+PHj09KjrLcZREM+Y52+Z0Xh/
         1MIuQSFL3f00OhHOJIGfLyIiRUTlLcNERoOS8iEhbKtW+d6cglLpTnFyKVsPEJffdRVS
         f5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziLSvpDPefhMh1YLhfgYvQRoU+jpwrEU6vRhvYQI4WQ=;
        fh=KRDEWvyke7PrVQX/CPq+c0eNs8YINW/cAZ6bB3XWozo=;
        b=gl6/NWLrky7b9fE0hq3KVBFwijhoNmNH6Hj2gol3zeA5jyHPdWbhAwnZ2IxNALKa+l
         WKY5PmlsO3x2E6HXEJ9EiNMLxaf6hHTD8qpEKVK3yu3qijmi3n2/oFGO4HBZqoSbZe/V
         BpLIU4kJzjYr7dco6vbQrmjIum+O3F5H52C4PBK2KR0o2SWNlHjnyVKtWvdQzVXS6o0f
         +Niin7XOCqftgWJYvzT97lU3n2PTJc0VeoRVha/Gne0HzdmIKaRwsdtKcqkit87OUOrV
         /aTbGc5QcbdYJ+u3zGyyZAL60Oi0PE7iXRg25gVRMPUaeiFfOFXqmUd55i0hkupeR2bV
         CN8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781064266; x=1781669066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziLSvpDPefhMh1YLhfgYvQRoU+jpwrEU6vRhvYQI4WQ=;
        b=e/+gZdUFaSnYmq+oa3A8g0IHAdWnnrm4k1lg2BBvufen+jX5O8Qe44w/lIh0z4ws2l
         sVX8WCXZNxZlYxY0RuopKeMJ03BpnOPdzHfTL5CHlzw7gbvVeDaAUWEbDCXjguRJkttP
         tNHkTjt4EXmPpZvBOdzJBRhwB8jwOl2HvSTsHr3UNGuVQRYeVnuakye5XQ/3Awe0eODY
         ylyTxOh+Srh4UIEIWOnqdJsAQtP6aVpALRMzfr2rGvkQctpTuXi6O9Y8SmrFKmGIkqH3
         JNSXGiclPUwwwwLO/097LDZAD+l8Rx1eDx6a4gsM/t71gJ6g3Dg5J0K8WlzSZ2g1TnKm
         /nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781064266; x=1781669066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ziLSvpDPefhMh1YLhfgYvQRoU+jpwrEU6vRhvYQI4WQ=;
        b=mKmUFw/w4H5VBGq3zZmEh7DT2GkMaM0sn8BBCxfiU9AqkgNm/vcILMQOd21MaHRCsv
         QhQstX4HOOEhOB+e0JS851xRM0sQHISrQyJ3qGt/yXwz4Cne0XIlCIRYVx+yon5/ktzh
         nrwE2xVR9mBBy3vJ8Z8pY++6uNc3/GOzsZDv9bRje6o0l06r8zDzPkmBzecO3kBPRll9
         sk3Y6xRRG3JnP0edloaa9JpOHe+OVva9tG1I1SSqwnkDjG2EfeVw/3heQf+7xFnPUVTv
         VJ2kOccCSRWngQjzgwawiXedupOXwfsiPyPNJHi9HVtq67bvbRLLUYt42h6w5zGpDwy/
         WkcA==
X-Forwarded-Encrypted: i=1; AFNElJ8v/flnjvkb4Ec6TLl0Sa84LpTerlNgPpUL4qsLmDbTs9IDUNc3nyuPpBh/e40oFP334lZxFdUOQWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUls5x/bSmXDAhOLU5Q1rxmdjfAn6dKcQLeRXGEKMjN6bFdJOp
	jVM5rcQ+znyJ7lgkhf/pH5fZAyV6EP1tEXOsZIn2xxYuoHCJ3Ui2709Ha2UNRaWyxsr+rmcR0iH
	Q9b1uza6ZdlwNlYu7k8HGBvhP6WWQa0Dghe5v8oxn
X-Gm-Gg: Acq92OEuPb9YipekuhTyCpS2RaayRU+Wc35l8N2y+kYcDjYsmuQVp4wFf17rJuvDbHK
	C9IveBmjmjOcp8Q709/keZ00onxvBiroOnG9+oI5uce8A//gOmTF5Tq/H/PPDglTj/aevmPY39B
	ljSsp63zYU1KJRYAJ2Ve2rs+/1sEXOxsOz3C7S5A8JNtl/LcqVFEA2dMO0kfzTrE4tRwoSUs5B8
	FWkNmFRCAieLTx5dbTR5FFHbFP9/XaCcVk9VqoUAcbe4NiUPgPCRPAfA7dlNTQZQni9AGxup39O
	58D6tAdsm0D6XcWydIds6H++PzgaSjMovf2jrlzQNNWqfyzCt0Gj6wsKBoXTuUGDUu25WTUreHm
	HTItalkHOOJDy8rj6oK5gBW/1LkpTfFd22Fz9Cg6w
X-Received: by 2002:a05:622a:251a:b0:516:dcbd:aaa3 with SMTP id
 d75a77b69052e-51795afe9f8mr282610471cf.26.1781064265597; Tue, 09 Jun 2026
 21:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781013810.git.sd@queasysnail.net> <c3c9ae09580a5c1d36b32b5ab3a5db398feddfe3.1781013810.git.sd@queasysnail.net>
In-Reply-To: <c3c9ae09580a5c1d36b32b5ab3a5db398feddfe3.1781013810.git.sd@queasysnail.net>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Jun 2026 21:04:14 -0700
X-Gm-Features: AVVi8CfyMQNdfBxuCedY0XLw0cG0g593wzGRzIZOYWbRpG2SfiMV52ctWCjxjrg
Message-ID: <CANn89iKy=kzfyRKtGt+dY8Fe-ScD95cD=uuy=Gkq79K0kcCdvw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tls: remove tls_toe and the related driver
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-91788-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[edumazet@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:sd@queasysnail.net,m:netdev@vger.kernel.org,m:ayush.sawal@chelsio.com,m:john.fastabend@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:agordeev@linux.ibm.com,m:andrew+netdev@lunn.ch,m:borntraeger@linux.ibm.com,m:hca@linux.ibm.com,m:pabeni@redhat.com,m:horms@kernel.org,m:svens@linux.ibm.com,m:gor@linux.ibm.com,m:linux-s390@vger.kernel.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:johnfastabend@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,chelsio.com,gmail.com,kernel.org,davemloft.net,linux.ibm.com,lunn.ch,redhat.com,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 490E6665B19

On Tue, Jun 9, 2026 at 7:21=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net>=
 wrote:
>
> The tls_toe feature and its single user (chelsio chtls) have been
> unmaintained for multiple years. It also hooks into the core of the
> TCP implementation, and bypasses most of the networking stack.
>
> Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>

Nice!

Reviewed-by: Eric Dumazet <edumazet@google.com>

