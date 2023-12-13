Return-Path: <linux-doc+bounces-4375-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D9808B55
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 16:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C3D1F213DB
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 15:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073394437D;
	Thu,  7 Dec 2023 15:04:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AB7128;
	Thu,  7 Dec 2023 07:04:15 -0800 (PST)
Received: from in01.mta.xmission.com ([166.70.13.51]:50210)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1rBFvA-00DcXX-OW; Thu, 07 Dec 2023 08:04:12 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:53772 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1rBFv9-00Bx3Q-Mr; Thu, 07 Dec 2023 08:04:12 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Kees Cook <keescook@chromium.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,  Randy Dunlap
 <rdunlap@infradead.org>,  Bagas Sanjaya <bagasdotme@gmail.com>,  Jonathan
 Corbet <corbet@lwn.net>,  linux-mm@kvack.org
References: <2acb586c-08a9-42d9-a41e-7986cc1383ea@p183>
	<e262ea00-a027-9073-812e-7e034d75e718@infradead.org>
	<c4233c97-306c-4db8-9667-34fc31ec4aed@p183>
	<87edp7jyu4.fsf@meer.lwn.net>
	<88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>
	<202312061456.2103DA1@keescook>
Date: Thu, 07 Dec 2023 09:03:45 -0600
In-Reply-To: <202312061456.2103DA1@keescook> (Kees Cook's message of "Wed, 6
	Dec 2023 14:58:23 -0800")
Message-ID: <874jgugilq.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1rBFv9-00Bx3Q-Mr;;;mid=<874jgugilq.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX18gHe4AAPySm6PcZ6ADt9YsIZiR6u4P+3k=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Kees Cook <keescook@chromium.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 447 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 3.5 (0.8%), b_tie_ro: 2.4 (0.5%), parse: 0.91
	(0.2%), extract_message_metadata: 9 (2.0%), get_uri_detail_list: 1.56
	(0.3%), tests_pri_-2000: 9 (2.1%), tests_pri_-1000: 2.0 (0.5%),
	tests_pri_-950: 1.09 (0.2%), tests_pri_-900: 0.76 (0.2%),
	tests_pri_-90: 90 (20.1%), check_bayes: 87 (19.4%), b_tokenize: 9
	(2.1%), b_tok_get_all: 8 (1.7%), b_comp_prob: 1.85 (0.4%),
	b_tok_touch_all: 65 (14.5%), b_finish: 0.67 (0.1%), tests_pri_0: 320
	(71.6%), check_dkim_signature: 0.56 (0.1%), check_dkim_adsp: 2.8
	(0.6%), poll_dns_idle: 0.75 (0.2%), tests_pri_10: 1.59 (0.4%),
	tests_pri_500: 6 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v3] ELF: document some de-facto PT_* ABI quirks
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)

Kees Cook <keescook@chromium.org> writes:

> *thread necromancy* Question below...
>
> On Sat, Apr 15, 2023 at 08:37:29PM +0300, Alexey Dobriyan wrote:
>> Turns out rules about PT_INTERP, PT_GNU_STACK and PT_GNU_PROPERTY
>> program headers are slightly different.
>> 
>> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
>> ---
>> 
>> 	v3: move to Documentation/userspace-api/
>> 	v2: integrate into documentation build system
>> 
>>  Documentation/userspace-api/ELF.rst   |   34 ++++++++++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |    1 +
>>  2 files changed, 35 insertions(+)
>> 
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ELF.rst
>> @@ -0,0 +1,34 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=================================
>> +Linux-specific ELF idiosyncrasies
>> +=================================
>> +
>> +Definitions
>> +===========
>> +
>> +"First" program header is the one with the smallest offset in the file:
>> +e_phoff.

Confusing e_phoff is the defined location of the array of program
headers.

Perhaps the "First" in that array with the lowest e_phnum?

>> +"Last" program header is the one with the biggest offset in the file:
>> +e_phoff + (e_phnum - 1) * sizeof(Elf_Phdr).

Ditto the "Last" in the array with the largest array index.

I nit pick this because it sounded at first like you were talking about
p_offset.  Which is a value contained in the program header entry.

>> +PT_INTERP
>> +=========
>> +
>> +First PT_INTERP program header is used to locate the filename of ELF
>> +interpreter. Other PT_INTERP headers are ignored (since Linux 2.4.11).
>> +
>> +PT_GNU_STACK
>> +============
>> +
>> +Last PT_GNU_STACK program header defines userspace stack executability
>> +(since Linux 2.6.6). Other PT_GNU_STACK headers are ignored.
>> +
>> +PT_GNU_PROPERTY
>> +===============
>> +
>> +ELF interpreter's last PT_GNU_PROPERTY program header is used (since
>> +Linux 5.8). If interpreter doesn't have one, then the last PT_GNU_PROPERTY
>> +program header of an executable is used. Other PT_GNU_PROPERTY headers
>> +are ignored.

A more interesting property to document is that PT_GNU_PROPERTY must
precede PT_INTERP in the linux implementation, otherwise we ignore it.

> Should we perhaps solve some of these in some way? What would folks
> prefer the behaviors be? (I like to have things been "as expected", but
> it's not very obvious here for redundant headers...)

All of these are really headers that should appear only once.

Quite frankly if we are going to do something with this my sense is that
we should fail the execve with a clear error code as userspace should
not be doing this, and accepting a malformed executable will hide
errors, and perhaps hide someone causing problems.

I really don't think having multiple copies of these headers with
different values is something we should encourage.

It looks like -ELIBBAD is the documented way to fail and report
a bad file format.


For PT_GNU_PROPTERTY perhaps we should accept it anywhere, instead of
silently ignoring it depending upon it's location?

I thinking change the code to talk one pass through the program headers
to identify the interesting headers, and then with the interesting
headers all identified we go do something with them.

Anyway just my opinion, but that is what it feels like to me.

Eric



