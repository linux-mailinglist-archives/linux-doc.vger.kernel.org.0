Return-Path: <linux-doc+bounces-95610-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UfS/EXrjTWrx/gEAu9opvQ
	(envelope-from <linux-doc+bounces-95610-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:43:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C7722003
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+jq7OyT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h8xkuJtb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95610-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95610-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2704E3065152
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 05:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86053BFE4D;
	Wed,  8 Jul 2026 05:37:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4893BCD38
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489036; cv=none; b=dZkUivcf7OsAvyRnzHQss8NiG9rM9nBGerQknFzjnHFuRkzM3i2jY8PtlVaUuUb4jxCPjwsC7q8heNbthjfdvevzzJ9oDwmo7BIDhYXk/aMDWlzkD+31qhxckVW6jVEzZRzoy3PQmSdCL127kH0mKpFewRBeC3RHW0YNv/9cjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489036; c=relaxed/simple;
	bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ox5wZYhd0jYWjZu3LVnyMJx3bInth/1/z8JZg6mly0uNLvW1oePapD9vMmt5pWWjd6Ou1rL4ODf/w7SGgQ2FB9tL59gM9W3WZxs+tu4x1f/hzGWaXy9GsfP+wggjRal/3L5DV9ZjaJHoX/fsu0fQaDs5abb2xOfeK0pf7xSL6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+jq7OyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8xkuJtb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842UU51638163
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=; b=P+jq7OyTqjAc9wXu
	RxNeVEVWgYrBpdAGK5o3b6AWPpRdC/g1cbrqpKSQiGfUKvq1e+0DgOyE1riJOnZj
	lMFxe7ytkjieiLs1bLJJoI6UfdSwS/kZFnw6Ci9E1IqzyI6Y9DJJ7r08KjH1V0ru
	9wrL3tchIUUG+dXTt3ewbVrMxTEodI7+6+wCRFSxdpxYZ7QWyJD1wL8qcbsxkW5N
	PWAAHB8x9PzRoHQMrt8RSH2RzIU9BvQagmTR5nMG7cOd30b9kwE3GnbuBDdz/2dk
	0MbD7d+C9BijjANSzQYL0Nrm5mXyk//z9XTUjvKIIksxsnJNEWkm7PJ44mkMqK5t
	bfEhbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8y3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:37:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845df469a26so909662b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489033; x=1784093833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=h8xkuJtbuDUK/6glmEL5W0ajqq21kzfRtjwCvyXm5wtJLYBGQweI8X/ZlHcvHOTS8R
         mCzSRT8AWj3x9dao13wIdi8Jw+Vc1S476/bExe0K77kYkdeGl+S8AYj5D7iR7iTOUhbN
         0CraUq8PwP8pCV0nh04tXClOkOwYZZ3U96Y6laQEKuHs3ooX0+GQlbH5yQgy9QA2Eoqr
         pWACC23IoU85UKqnIbwnH65DZvaGuPOcTZkhGprHIW25eUJFcuhmNQ+WO6pmp1p69cTn
         Dd2y7+Bo4GDXGgPddQ6SlIEJikmMXOVSlSUzslbWnUNEPLYYjTqaP8eHJJn3cbyA/9fv
         wKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489033; x=1784093833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=lnNC0tG/hlJAghfE5kfoGgfEJAJYD4O6lHvBnlUOXW7gW+P9b1QDOXIzWd9SldqKSE
         zYw8D5oFM8JcTuw9xY4e1OybrJZ4qwkRAPNCprEIipjy31tCfijtdHoWb/biji5z/t4i
         aNX2g4Ucfki9yiXGqRUGSqZaSpekdQh8NcU7MsmkRkKez10wr0czfsQLBFpgES2bOKG5
         EZIZHTWZGSLjDJ9rhszrkyXjEOhNlhrmuX3iUD/CLupLIyDNm3w0vvn+BfQlMPTQ3uA3
         5VXjKZ1AUWvUASRwA+dlYGyiQBoOH09akDjSBL3kArHZZuPS/9if72HXpCw6KO4X3qXt
         U7Yw==
X-Forwarded-Encrypted: i=1; AHgh+RrsSVQwEjtcTnbXaxQ2o9s5GTueVoprMKmC3JaOV7tCQdMCcQHFOOMPMa36ApdFMso9eh+B2eEjqo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tnWJ7lg2/J/noFlatwvRgRXUrMWqlRSgC0vtnnTeZXvp1neM
	hf+DcLceJ7uNp6Y07mGkRy9Z9UGPhZD/cWw1Is2OYXjiSxoWLLnoGr+sQ0Vf2M6jYWLE+yBuJKG
	oBYhU7Pm8lfNO0ilmJ/NUkodaJzyELpNPc63LCLdPlrHnsLeF5pj1wez476nJN8vjzTH62G4=
X-Gm-Gg: AfdE7ckl34vL9nMSmaUO80stmSml3vTJFQjsXChBj34H5Wl+OL4NdHFxTYwnD0b7e56
	cBJgGYbErZ/PJR6m1Rcn4MDBkm6uEB1C+Kk8q2SqTAjVf1RlBj/bG/v4McAGSxShtUlFz2zLUQ1
	L2CqOZqhKnUCOEQH0m23obDsJAE4lqz+HRTm0PIjg1cr94v6gjRedA4ZLDp2ujDk0F0IREOF4Ju
	2VjDS9jUrXDuQHC3aa1q6JvGQplHu2cWaf+bR0GgRLboxPDHW7LuSjfm/lCc0hGFdQ0wP60CZIM
	DrIlQRwNAp50fcEeXXu/i5kIjd1+iSVYXdnYaGCM4E1VFcTvH1kRTT88GhFLpO016KkBJ6B+VhN
	DgiGPWP9lvgRa5EYhIHSQDRsM6DIuOvZtAekNfw==
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157490b3a.18.1783489032802;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157416b3a.18.1783489032130;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:58 +0530
Subject: [PATCH v3 19/26] mm/numa: Register node data information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-19-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1048;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
 b=MyMhtvJ0wOXNwjzXvlmiA8Ab9JBujyIxKxBCpE0ObhCZPfckWyAffIDGpRxS9EBhvOuKic1KN
 jH7INpGJKThDjepKcHIt//QYPSzCAx6MP/DqcCdV9jTWtJ2PBlwoCaR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXx960kaTXccd/
 9+WQPFMbe6qyk9gn8Mz3zltARObVTN9lpqjTfH1VomiWrouuYWvUy0kD+UFAq26DaaZ/0u3h7Bm
 stwMXzIogEpUvoNtYdR6x8YmZBRQMq7uFqdsNSRXm37eTPz7LGbHNUmNARbdXQFRbFmunpCjppC
 2VvQrQN87qh/wOF0kvlY71Wa74miICxCVrqQMDxcOYeQ8nJeh8eEv/0iyK2+WjmwXUcAJlsFQwB
 Dm7fAlxSa2nxkf/0RFb1kAqAueY1RQx2aFPq+yXfYflMGyKLThC9KxZEE8XPHvhtcO3bx3BnpgA
 ie5NlsEW8NoX+2+g+eVlhxgMvYw5ipcal/MyWNDJkzlUR5LJ4PU2011Vq57SGgEYEsOheHyT8O8
 4jXoreRUcM5zj86osxMpFEN4PC/BPh8WPQQv0EueXYx1ZaNL0+MM8+FE3W4+nuNoZjjkgeCGhD/
 +S8zPbkqz9Vb3JaumRA==
X-Proofpoint-ORIG-GUID: Nei_3x7QeuEz8ESzBQ1B-gZx7kIwYhBa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX97Jt/jLjyBW+
 EUjumYH4RcpjKMk6ZvBcDuWzFlMyv3nzfauCszfch3H7TssUtkaUKOz1LVvxqP/gd8q63bLO9xb
 kztY2KZ0hGaxySsIA4FJZP6XxBq5fVI=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de20a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nLJQaZXserL0MincpKQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Nei_3x7QeuEz8ESzBQ1B-gZx7kIwYhBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95610-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 887C7722003

Register dynamic information into meminspect for debugging:
 - dynamic node data for each node

Use meminspect_register_pa() to collect node data into meminspect.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..f04740dfb2cb 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	meminspect_lock_register_pa(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,

-- 
2.53.0


