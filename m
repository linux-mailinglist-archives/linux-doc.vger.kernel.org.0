Return-Path: <linux-doc+bounces-95606-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1x00Iv3iTWrE/gEAu9opvQ
	(envelope-from <linux-doc+bounces-95606-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:41:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD3721F83
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:41:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jIQYjWOp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IWpliJQV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95606-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95606-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 215D1303515C
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 05:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9EE3BCD13;
	Wed,  8 Jul 2026 05:36:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C685377558
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488973; cv=none; b=XDb4VywnTLm4rvTnxo+YYcAsEpjh1xyT+MYwlMrlnkO3YZRQ02ayswdT2bQNVIWuYtS4CjA1+m6SprHI+YjbLNMgDHddTTA1TCphGcqdGG/dzx4yRZMiIh880/Y0EHVmQSdL00288PudA5+XX0yTDqZolF43orxxC4Ay6BeeGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488973; c=relaxed/simple;
	bh=FiYNk05u3l6OjFfNfEuezoiD9Cy7r8n24C3ZFgyQiD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMj6Y1vF1Mj3hf9eL2kOIwfc0IpHV6XptxXWmvi5yvrSwHfJnLCTJz1Lw+Lv8Z2Rfn7/WPYMNLg5kBQIRnAk+r8qjdQcOcsdmrTZtgGtyhpftERLsnOsP81FIWvCqrb2WBJvwk7p5nkvPPNNGh4DoDq0NOG/NvKNvJWKyZYDJe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIQYjWOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWpliJQV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842HJS1572861
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=; b=jIQYjWOpMdm4Yf7/
	4ZAx6VsUGkkHx0nISbMer6Ogn/gK2G51oS6foy6Mgwl4NbjhK79MVO52gyhU8v4+
	lw+vlWG0mBYq153kmRtblw9p85pGfVTgoBpeqdZ8A6nDtgtpcHmfumsr30eRS9L9
	iwpMpdI9qaaC26l7CgW+S28KPz1Bw8vDhH4rSyEWBFhXFaJ2m9/Yn9YxEFw0L+RZ
	Av9xJ+vKxbgKHJWyxplIeJ82xC/NRVC6fyNpAmMjrVZ1ynOf78It107ASYJ6z3kA
	FSRJ+dnkJ64wUDccTgvDKXl0OIkKNM6qSZG+Z9+vIvUNqnDvu5CwLUQVKhBpYqQo
	6/3Dcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgshu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:36:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847e78d656bso813877b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488970; x=1784093770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=IWpliJQVuey5C6UxxRmTKSiW8a2SnYeT2vZJHFycTuwxyPc5QkBBqxywhFUarXwiSP
         rXqJekS6r4vtsOW7qIdrfoaww0sm5hllqZ2vw/w2WwfrQmuXv4jhDq+rgQ0K37h47/xl
         FEzh91nz+fwjM8OX693bGIuoGzE0hQLZunKHVLwmZcaW4ubyoPtCHpcQlliYIaDkU4LS
         ORqjEI0y2LM9JfYP/SXArimQ9Z/BnbIuqnS3iOZjuUrL+N6x9xFs9xIYoXJG5pyOkf/J
         TXnTOp8hUYhXY/cRmDmNXCJ+swyLTZSYi6D/SRPoAcm5IwWIYK81X6NUZy25PdP0BhKF
         6x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488970; x=1784093770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=G03ZWLUkELrBLjCzc4LjtLJapwS+dBHdzRHnWE9W5QTDW3BM/3BGjRhZ3hBuORVcxY
         6bv/vqw62oRtmbboiN+Xr4TLVLYWP2YAKKra6nVxZ6/UUH6mBr84nTHqdCofDfnhseRE
         gGG5VSMnezEVZArASlEEHRo5ewLEFGROPuDUtDNCAsLHWNW9wDSi2lyGfzE9U/P9PW/t
         YXr2NJZn0bb7ncrQBs3JR+bogxsfJQt6v0pvWYvsLHBjfYZlulAkC7Da2hIQfUWkvITT
         59004RZLFMi0ofYrzJmgF6U0+XjeMK+arE+qIG4vtpUg1yXZmMIkYQa5oGlggOOq5A5u
         CkDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3soq82+2iNXVO0tMF6BvFuxxRSdDIxsgLctE1zmBg/8SU9jdLrWfa9T9yNISPO1pnGm9bUWQMYXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JND2CrwgvpO+HEhWnW9ohOUdMz6t/JotqDX7jGtQcOT0lCzW
	tgnqi6LLJKmBm/nG9B5JQumKFsO6w5YNqIdhc27WDgdWOdPyQ072IG9r3IcWD6qnIAedz32703Z
	6bpsbYXTk0CWIPhfczjQH/QZu893BZYYH6q9T0a0eA8yFbRSpqP+cM4sHxJiqwEE=
X-Gm-Gg: AfdE7cmBDYE9+SuDniCU/T0jZe4GpajoqxayGzoOP7pbMSWcryaGjdYBlV0ZpTxIHnl
	1slgV/0Ir4JTob+4o31KjvGD4B8onqjhigwWjP82b4kRK56EujQgiIWR1HmN4m4EZtXnyG/NANX
	82HAqUwp6s9IjzcbziVAV4z/AYVeIl14o+la+SINj2DjUqSjMesAG6gKlVURdNfwwgag1SE5Vmt
	m4i09666t6ZNEu6ylRwpcayWIUhoTsafM/M4Oe0UwMRZtoPveGkYwEjukCxl5ENyf5OZBGNHk4w
	fpuTBTl639aTyw837sWstmlMc8D2m/0SCpcR4daX+PtLgPlUywwLs//KhAMHPhqAVfqkmROY04F
	PLQznJ2NAdTFIfWiu4DK/fG9t6TRTgFelVxFjNA==
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172478b3a.32.1783488969232;
        Tue, 07 Jul 2026 22:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172435b3a.32.1783488968604;
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:54 +0530
Subject: [PATCH v3 15/26] panic: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-15-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1392;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=2Ckm+YqBY68LnQw06/xX1Rice7q7oHfxcc3Oa8J95tM=;
 b=kNcFd/6IJruvhbZhgcKF1kf9nMQRpQthTbMHEFUl0hfgNNJOPNaYN4PdRHLxJ2YhHQpTBO7+8
 6jxCLWuRI8VBffFPcyBuoS8d2GFeO7KijR6/mLX0R1hgBfH+2V4jfL9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 8b5HQLMiKCesD2yh5d40GVoG3PrJItTn
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de1ca cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sIx07V1IIwI039IRSX0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8b5HQLMiKCesD2yh5d40GVoG3PrJItTn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX0ZyEKClNbMhk
 xwASZ96KTQ3fWRuFn4yeDsTGxf8AYd4J8n2CaSKJqZwUxXVKO8ubgItbS9CZAxHDVD8gliWSRTJ
 qBPJMygwF1rddBvdHFA3BGVhIPlLi5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/r1v6ic6iNS/
 h3iFaO/lJFUCRuTcZk/w9sJPzeaqS6QYCX8iQ2VSAwBTMA6DwTPSXEIIVNEKXG9rd5kKDZtzltH
 RAdDytlP5BAgqKlozSk/xPe02Wv25UFv/pHUXD3sl2/f+6mVryQdex+W4nBwJOrTtBuNYMPmeCb
 MZK6ZfPMNi5wbN//5czHe1p/qsrAB3f5d3T/tSnOQCaAJPALFkSRJcD03gvyyv+616AeDy648G8
 hmRg2EEM9yg1vK1TM3hReIdqN6Xx6szcRn5EHCHI8JQle7aDx2Wqd9DCTp0ch5tXnBMItpaDoSy
 U5Jm8mfEIPpoid36qea2IbpRc4IFW7bSnvxpYY+yUtRREUv50/P9xicfWGBmtD+vsRtyGl5RoH8
 9taTTVMSTjPa92EWyaN9i+wAKGdxL73gty/qKgD3ELZX+YM/DJ48pBemvXjICZoTTlvySNIQinH
 ZLGmsw1kKmFc97mGNCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95606-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEAD3721F83

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 90e21f15fd7e..31d2e08b7e2b 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 #include <kunit/test-bug.h>
@@ -58,6 +59,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -833,6 +835,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' '),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)

-- 
2.53.0


