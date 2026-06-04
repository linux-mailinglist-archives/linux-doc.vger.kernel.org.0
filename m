Return-Path: <linux-doc+bounces-90963-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wARLMgGlIWosKgEAu9opvQ
	(envelope-from <linux-doc+bounces-90963-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 18:17:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4228E641C2D
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 18:17:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R57WYhlK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="TzwKFFr/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90963-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90963-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7827D3141673
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B183CC303;
	Thu,  4 Jun 2026 16:03:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02C38E8A9
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 16:03:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589015; cv=none; b=JMejQ3QKV1hcv2jHqoS4+sCG0BDGKsJtO/QHBes3FpJeVvCiWSZY7Fpq5B4GzQk1YVESkxpa53v4ZBUxGpvnHOMtOx2F18aX+iTHqw4RtDIxYe3fZWuvSpRzO70Eq2pu4QYQl+XfmRetRy9OdBRwctARH7kZq3ezgXTDUOIYvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589015; c=relaxed/simple;
	bh=Mpc15BTxXFPLS7siOrt94DVTxzgWbPGCx4J/ojX1QSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVJNZuxTGRhIZ+43m6vSsktmx/8ioRzhhQ8tGz+KDbbVyA6ET7uAomPfkippSsBX4D9Sfhl8nizo8qDnvxFvdw5OJfl8CniEqFRcHNS0EE6BMQkCfBaIt/mq3QqWr1+9C/yugj1qGobvR7Q7bT5eKhe6Ie3VJd1yAExS9MSIc0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R57WYhlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzwKFFr/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJoA4944402
	for <linux-doc@vger.kernel.org>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d519xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 16:03:33 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66063190853so1824457d50.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589013; x=1781193813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=TzwKFFr/yAqAzsnz24uUZ2xYa0AKrhpiOmdwSN4zzb3G1FeWtsYG5lyd3Hsb+OUfMJ
         hIXbCczAD1Lns2anFm8HA2kw1NOKbMKhD8k8ZiQtae3PTHslV8T23VKPUMINx7dp7vHz
         xEHjxdssQfhQpGl1tNqO8daUw03uiuF9m7PHOHYH+a6h93cmIFn5fkS7phl/zWgALKnF
         vHxtgXmkFWk/A4wRHU8+ENAWZ998LoaEZbCoLcVsGM/0BLgyAKvtEUZ+dk9ko1Yw7NFF
         WTyZful/xUvQkTRB5/62Brdz2XW8eUpmTYia4q2M/1/FTRkzjcjlkB4HsIFL5caekQM7
         k2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589013; x=1781193813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=cgnn1oFWNWuttszVBiL5TRt6Ckayx8moQfWgkGx+sPhhKck5fbG8lXvDl/GIJhevjt
         JloFa5sffGSppgCajJpEn8Fvpn3iFI4vKiGDopAgm/lq0DM+IERTpRw7Iv61ktTHTTiy
         mpjnA04je/oRYb5boLJm6Uh+DWNCapyqXn5nL6vt1xM6fPRiQ0sRLfghmbVkDK2EdYqF
         n8sKBrK6LXHt5k/T3yDOnjoTApkU3DP7t4kmD/JPOYbvbjdFT5d6bkx7uvTtrW3e5PHj
         YMXWCWroF5SsaT701BcROrMNajgMxHHG/pkL/1j5r0+W5wCKKri/nwMwbAVUaMvCZdLA
         IFmw==
X-Forwarded-Encrypted: i=1; AFNElJ8xgeT6nH9NjpPpBZPCR/8IWCL0Ekg16+dC+9suhUqXIoyaaUd+AYbwEvPCqJCUEWWL1Pwqcba9Cco=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJCWk2yGrOqYs0paF7lh5POxMTsMb6I2nb5we+L+Mc+8lt3sz
	aDNSInZncnPUS8PUvSk9JeeRcpc3Gap6QU0UYlJBPET+x3paKNImnZqZhBA2i6T48xjcSB6YIkK
	NkTgPFyplPAewwXpjndBEjBf3JwjV9XxO0j8qEeDq53KDzEZHMqYmzIfbfSk1P6MwlwJN4TM=
X-Gm-Gg: Acq92OEEO0CqJkNTIS93ybU8fDKf23w8Ut2L7sqL1dvBkc4F7T4C89UuOWaKyGQ/vkk
	uFUhu+1oMgTDQxMvsN6P9cAEQ9zzWhd88PKM3pMzJ8+MfrN/7T6YF1AlDiEEhnQtROj8ew6SITd
	oVSDKQyfyxw8SysIHMITtUKvwoZ0RvyKXdsvDpKpeYfymEe2jNrQf/2EqeNZ5BngneSz0cAdTjk
	qZmKZpEzE7fqGPS1U3COwfd4+XQIY+0+1tXMXWfOTLXVbJBpu9Xc76e8GV7E0Fiw9PJ9RP0klup
	ECoNtbk6Tw3YhYBPDr6MUdPABzt2Toh1BR2YxD1Q5kLxctKVk2K64Z69gkdBfK72u+HZSPWpw63
	o1IMmeKI+S1olIA6rrCSxv0LUUWBgEJRH/J4NquWgkA==
X-Received: by 2002:a05:690e:134f:b0:654:2882:42b8 with SMTP id 956f58d0204a3-660dc29ecd3mr8042136d50.35.1780589012912;
        Thu, 04 Jun 2026 09:03:32 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-ORIG-GUID: oPHP6AG4e61Blg6I1RzoBhanTSplMwM-
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a21a1d6 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfXxOo+iA3aqJr6
 y0v6KIkiHPlNx+OavzIOh0bOaSMphnb1JpuS1vhhXxg5aD53FJWgEf0BZhLWad+D9bRia+yzk5W
 BOgbORZmuC3qDi/IuioH3/Xxv2aXicAF26j8RWnVke9ySjCb+3MjLjezvrwa/FKWohKgI9kR7uv
 gK3oSYbd2bNSbDD9ed0DSBExNMQ5T/gc9YrR8RwWfFMPICg3a816WtQqBCiBxrI70TAtDLzY2f/
 jK0cz6IWjJvJLREDd3ND29ioSbg8TQgcY99ZIBLDuc8pIMmqLfQLG2s4NZWtYjg19Nn0OtzGSby
 CZCaQLhf+C48A199DELUTn3NQy4t7MwYmFXh6uZoYH0HQHr0g8E835FEn/K3TaHprXwScKb4wv/
 KX+EigD+N3boetEDHbBSj8fuRZM0m/sGuLNqWectMJi8xV6vlfL4KrD0Ot+dYK34ytZsHSQfrWe
 Skssi/tDlpFIbW8G9cA==
X-Proofpoint-GUID: oPHP6AG4e61Blg6I1RzoBhanTSplMwM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90963-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew.jones@oss.qualcomm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:docular.xu@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:conor.dooley@microchip.com,m:shuah@kernel.org,m:brauner@kernel.org,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:palmer@sifive.com,m:conor@kernel.org,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:thecharlesjenkins@gmail.com,m:samuel.holland@sifive.com,m:charlie@rivosinc.com,m:jesse@rivosinc.com,m:andybnac@gmail.com,m:docularxu@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,uw46cc5sxpb2:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@oss.qualcomm.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com,microchip.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4228E641C2D

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew

