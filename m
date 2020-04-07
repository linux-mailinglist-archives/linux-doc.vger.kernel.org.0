Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984F61A0FB0
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2020 16:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgDGOyf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Apr 2020 10:54:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:25333 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728855AbgDGOyf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Apr 2020 10:54:35 -0400
IronPort-SDR: vzH2e/ETbj/Ls1bFDYAfNn5Ele1iE+N+3Ma3JrI+SPdUsapHZh3oUD0xO1TfDoiD54Jj6HW3PF
 /HcFSleC2vkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 07:54:34 -0700
IronPort-SDR: cOZmMIE0ak5uQfYildm7qw134FQCkEL1T7TEy6C+ICKnfA8A0r6yAgOesc5pOEYZpwGdg1fk17
 thIr/oSRo8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="254480922"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2020 07:54:34 -0700
Received: from [10.249.224.62] (abudanko-mobl.ccr.corp.intel.com [10.249.224.62])
        by linux.intel.com (Postfix) with ESMTP id D324C5802BC;
        Tue,  7 Apr 2020 07:54:28 -0700 (PDT)
Subject: Re: [PATCH v8 00/12] Introduce CAP_PERFMON to secure system
 performance monitoring and observability
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Morris <jmorris@namei.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Serge Hallyn <serge@hallyn.com>, Jiri Olsa <jolsa@redhat.com>,
        Song Liu <songliubraving@fb.com>,
        Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
References: <f96f8f8a-e65c-3f36-dc85-fc3f5191e8c5@linux.intel.com>
 <20200407143014.GD11186@kernel.org> <20200407143551.GF11186@kernel.org>
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <10cc74ee-8587-8cdb-f85f-5724b370a2ce@linux.intel.com>
Date:   Tue, 7 Apr 2020 17:54:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407143551.GF11186@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.04.2020 17:35, Arnaldo Carvalho de Melo wrote:
> Em Tue, Apr 07, 2020 at 11:30:14AM -0300, Arnaldo Carvalho de Melo escreveu:
>> [perf@five ~]$ type perf
>> perf is hashed (/home/perf/bin/perf)
>> [perf@five ~]$ getcap /home/perf/bin/perf
>> /home/perf/bin/perf = cap_sys_ptrace,cap_syslog,38+ep
>> [perf@five ~]$ groups
>> perf perf_users
>> [perf@five ~]$ id
>> uid=1002(perf) gid=1002(perf) groups=1002(perf),1003(perf_users) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
>> [perf@five ~]$ perf top --stdio
>> Error:
>> Failed to mmap with 1 (Operation not permitted)
>> [perf@five ~]$ perf record -a
>> ^C[ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 1.177 MB perf.data (1552 samples) ]
>>
>> [perf@five ~]$ perf evlist
>> cycles:u
>> [perf@five ~]$
> 
> Humm, perf record falls back to cycles:u after initially trying cycles
> (i.e. kernel and userspace), lemme see trying 'perf top -e cycles:u',
> lemme test, humm not really:
> 
> [perf@five ~]$ perf top --stdio -e cycles:u
> Error:
> Failed to mmap with 1 (Operation not permitted)
> [perf@five ~]$ perf record -e cycles:u -a sleep 1
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 1.123 MB perf.data (132 samples) ]
> [perf@five ~]$
> 
> Back to debugging this.

Could makes sense adding cap_ipc_lock to the binary to isolate from this:

kernel/events/core.c: 6101
	if ((locked > lock_limit) && perf_is_paranoid() &&
		!capable(CAP_IPC_LOCK)) {
		ret = -EPERM;
		goto unlock;
	}

~Alexey
