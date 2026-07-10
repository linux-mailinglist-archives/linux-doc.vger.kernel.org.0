Return-Path: <linux-doc+bounces-96212-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 127wGlqxUGou3gIAu9opvQ
	(envelope-from <linux-doc+bounces-96212-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 10:46:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 661DA738A26
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 10:46:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Rw4VOWqW;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96212-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96212-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D547304AB63
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6563D170C;
	Fri, 10 Jul 2026 08:32:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813A03E2745;
	Fri, 10 Jul 2026 08:32:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672379; cv=none; b=IrH7yiOj/RD1oGuOTtbqrE6um2tPNgVEPDcEGN534HkQLqpnOketKM025+kdkxy7VV/fq7VqWVGpCuJs+cRwG03lY1ueEFVFADlw73mA5AqB35I8qwobtS/uyzvN9RVFFY030ksVpIX6P3DxYGKBJxIvRHrVSzN2WcKab1jkXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672379; c=relaxed/simple;
	bh=SG0XBAioEjYZTBGt6P9ErBDYFiptTZabvqCNq2HPf+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDDFSu+KKTJR6+1GRijAwxACFKukexhCAZ2SOmqGSWOPLfzsIgAL7a51m/r1GBx9wS8UGP/pP3eq31sS3tzWdtubALWABQvpTjfA3/Jx5f5a2TZlB2hN3oLyBAA5o5+x0Nuqf94EcmFg3evcV4FEIM1fkCNI0e/BcPKR3VJRQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Rw4VOWqW; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544991D70;
	Fri, 10 Jul 2026 01:32:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB2EF3F85F;
	Fri, 10 Jul 2026 01:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783672372; bh=SG0XBAioEjYZTBGt6P9ErBDYFiptTZabvqCNq2HPf+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rw4VOWqWQa+ucn+WdZ7T2TnEl+xGjwULwE7Sq4d+MyAV65zjq+cFshHhdUAtW3QXs
	 IJjzWrEFGQnEZmhuTGWoSrupicN4GI7lNYbwcoFrLh8U2v1wlz4CAtTtCN6GBjkIev
	 N3F/Eib1vG/7fbUJ8Y2QaXyBxQ+zl7lYNTlvpdcY=
Date: Fri, 10 Jul 2026 09:32:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, brauner@kernel.org, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Message-ID: <alCuJsOgh1ioFHAL@pluto>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
 <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96212-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:subrahmanya.lingappa@oss.qualcomm.com,m:cristian.marussi@arm.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:david@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,linux.dev,meta.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pluto:mid,arm.com:from_mime,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 661DA738A26

On Tue, Jul 07, 2026 at 12:01:37PM +0530, Subrahmanya Lingappa wrote:
> Hi Cristian,

Hi,

I will add a few considerations here aside the main points highlighed
already by David in this thread.
 
> 
> Thanks for posting this. I think the direction of not forcing these
> Telemetry Data Events into hwmon/IIO/perf prematurely is the right one.
> The cover letter explains the core problem well: most DE IDs are
> platform-defined, and without external metadata the kernel cannot reliably
> know whether a DE is a thermal sensor, a performance counter, a power value,
> or something entirely platform-specific.
> 
> That said, I think the current layering is still too SCMI-shaped for the
> ABI it is trying to introduce.
> 

well... "Introduce SCMI Telemetry" seems a pretty much telling $SUBJECT :P

> The thing being exposed here is not only "SCMI Telemetry"; it is a more
> general kernel concept of telemetry:
> 
>   - enumerate provider-specific data/event descriptors
>   - expose capabilities, units, data format and topology/grouping metadata
>   - configure collection rate and collection mode where supported
>   - collect samples with timestamp/freshness/validity information
>   - track generation/state changes
>   - optionally expose provider-private raw backing storage for debugging
> 
> SCMI is one provider of that model. It happens to transport the data through
> SCMI v4.0 concepts such as DEs, groups, SHMTIs and TDCF. But another firmware
> or control-plane specification could show up later with the same broad
> telemetry model and a different wire format. Call it XXMI or YYMI: the
> protocol mechanics would differ, but the kernel consumers should not have to
> learn a new in-kernel and userspace ABI for each one.
> 

So, in the early episodes of this Telemetry 'saga' when it still was an
RFC [1] in which I was exploring/experimenting/evaluating different approaches
I DID mention that one possible evolutions of whatever interface would have been
used (SysFS vs chardev vs FileSystem) could have been:

"D. generalize enough one of the above choices to make it abstract enough        
   that other non-SCMI based telemetry can plug into some sort of geenric       
   Telemetry subsystem"

...BUT the reality check that immediately stopped this possibility onto
his tracks for me was the fact that at that time, like now, there was/is
ONLY the SCMI protocol acting as a possible Telemetry provider so that would
have meant:

 1. limited real use case examples to use to build a common Telemetry abstraction
    resulting most probably in a 'generic' common framework heavily
    biased toward SCMI mechanisms...for the simple fact that only SCMI really
    existed that provided such broad range of generic telemetry data....

 2. sure rejection from upstream, having created a supposedly generic common
    framework, sadly used by....just ONLY one user

These concerns came on top of the basic main fact that, as David pointed out,
a fully generic and common abstraction of Telemetry concepts is hard...

...it definitely seems easy at first by looking at some basic simple
common ideas, but it quickly becomes very challenging to represent in a
common way very speficic bits like, as an example, topology, grouping
etc etc ...and again especially when you have ONLY one user of this new
abstraction to look at for inspiration ...

> The common ABI should therefore avoid treating the DE numeric namespace or
> the wire/storage format as the abstraction. The useful common contract is
> closer to:
> 
>   - what is being measured: component/type/instance/name;
>   - how to interpret it: unit, exponent/rate unit, data width and signedness;
>   - how it behaves: instantaneous, accumulating, average, state/counter, etc.;
>   - how it is controlled: individual event vs group-wide collection;
>   - how fresh it is: timestamp, sequence/generation and validity/error flags.
> 
> So I would strongly consider inserting a generic telemetry layer above SCMI,
> with SCMI registering as a telemetry provider rather than owning the stable
> userspace ABI directly.
> 
> Roughly:
> 
>   drivers/telemetry/
>       provider registration
>       descriptor/sample/config abstractions
>       generation tracking and poll support
>       common userspace ABI
> 
>   drivers/firmware/arm_scmi/telemetry.c
>       SCMI protocol implementation
>       TDCF/SHMTI/notification parsing
>       translation into generic telemetry descriptors/samples
> 
>   optional provider-private raw/debug path
>       SCMI SHMTI mmap or dumps, if kept, behind explicit privilege/debug
>       policy rather than as the baseline telemetry ABI
> 
> With that shape, future in-kernel consumers could bind to generic telemetry
> objects and capabilities instead of SCMI internals. Architected/well-known
> DEs could later grow adapters into hwmon/IIO/perf where the semantics are
> clear, while platform-specific DEs remain available through the generic
> telemetry interface plus userspace metadata.
> 
> This would also help avoid making the SCMI protocol's internal resource
> storage part of the ABI. Right now the public protocol header exposes
> structures such as scmi_telemetry_res_info, scmi_telemetry_group and

Well here you are mentioning the SCMI internal API as exposed by the SCMI
core in include/linux/scmi_protocol.h and used by SCMI drivers to build
on top of the common protocol layer...of course it is SCMI specific,
always will be, even when/if a common Telemetry framework would exist.

> scmi_telemetry_de, and the chardev indexes those objects directly. That feels
> too tightly coupled for something that may need more consumers later. I would
> prefer copy-out or iterator-style provider ops instead, for example:
> 
>   info_get()
>   de_count_get()
>   de_info_get()
>   group_info_get()
>   intervals_get()
>   collection_set()
>   collection_get()
>   sample_read()
>   reset()
> 
> where the backing arrays, xarrays, lazy enumeration, SHMTI mappings and TDCF
> parsing remain private to the SCMI provider.

I could agree on this...IF any of this would have a chance to exist now
with the current existing Telemetry providers...thing that seems not
plausible for the reasons above....

> 
> The sample side probably needs an explicit common result contract too. A
> sample is not only an integer value: it may have optional timestamping,
> provider data width, stale/not-yet-valid state, partial collection failures,
> hardware-fault indications, and a sequence/generation value that lets
> userspace detect races against reconfiguration or shared-memory updates. Those
> details can still be backed by SCMI-specific status codes and TDCF parsing
> internally, but I think the stable ABI should expose them in provider-neutral
> terms.

Yes some of these are theoretically possible, but NOT really in the only 
example we have so far that is SCMI....

> 
> I would also be careful about freezing the raw SHMTI mmap part as a baseline
> ABI. It is useful for bring-up and high-performance tooling, but it exposes
> firmware-owned shared memory layout and TDCF parsing rules directly to
> userspace. If this stays, I think it should be clearly separated as a
> privileged/debug/raw provider facility, with a precise mmap contract:
> 
>   - required mmap length
>   - vm_pgoff semantics
>   - page alignment
>   - VMA flags
>   - cache/coherency expectations
>   - lifetime across reset/remove/reprobe
>   - required capability, if any

I would also prefer to expose only kernel mediated Telemetry data to
avoid fragmentation (even within the same protocol when implemented by
different vendors...), BUT RAW access I am afraid is inevitable to be
able to write high-perf tools, and those will have necessarily to be
protocol/backend specific...

...which leads straight to the other point raised by David...

...Is really a common Telemetry UAPI needed ?

...if anyway multiple protocols would dictate multiple custom tools
probably not...

> Even outside the raw mmap case, telemetry can be a sensitive high-rate view
> of system behavior. The ABI should make access policy explicit: who can
> enumerate, who can read, who can change collection state, and whether
> production systems can restrict sampling granularity or intervals
> independently of what firmware advertises.
>

Yes this has defintely to be documented better...but..

..this is something again very much protocol specific, that evidentiates
once more that a common ABI to rule them all is not probably the way...

...in SCMI the platform firmware is the ultimate arbiter, it is in charge
of any kind of policying...it can cope even with the most unreasonable
asks coming from the agents, even come from root privileged users...

...simply because those requests will get denied OR silently ignored...

...in the case of SCMI Telemetry, as an example, it is up to the server expose
to the Linux Agent ONLY what it deems to be safe enough to be shared with normal
world entities without the risk of enabling side channel attacks...

IOW, in the SCMI world, in any protocol, the agents see and live in an
illusion that is created and enforced by the SCMI server, if you are
switching your point of view and start considering how to enforce policies
around SCMI resources at the agent level ("...only root will be able to do
that"), you are already doing it wrong...

Can this view of the platform be absracted, Telemetry-wise, in a common
interface across any other protocol and any other arch ?

It seems to me, again, very unlikely...

> For the stable telemetry ABI, I would start smaller: descriptor enumeration,
> sample reads with validity metadata, optional group-aware configuration, and a
> generation counter/poll mechanism so userspace can detect reconfiguration or
> partial re-enumeration races.
> 
> One other point related to this layering: configuration appears to be global
> to the SCMI instance. Any process opening /dev/scmi/tlm_N can change
> collection mode, sampling interval, DE enablement and timestamp state for
> other users. That may be OK, but it should be an explicit policy decision.

Based on the SCMI architecture and the SCMI implementation in Linux, the
only boundary that you can use to identify a 'user' is am SCMI instance
(i.e. one /dev/scmi/tlm_<N>) because that is what the server(s) on the other
side can identify as a distinct agent and that it can fed with a well defined
set of resources at enumeration time...especially in the case of Telemetry
it seems dificult to be able to partition resources at the agent side...

As it was with the defunct Filesyste approach, I would NOT in general
enfore any policy on configuration...last config request will win PLUS
a generation counter to spot unexpected reconfig happening in background...

If you are using 2 tools or daemons to configure telemetry on the same
system in a conflicting way, it is NONE of kernel businness, you have a
misconfigured platform..

Last but NOT least, I think that maybe a Telemetry framework subsystem
could be instead useful for future possible in-kernel users of Telemetry
(you may have mentioned that too..) ... should someone decide to use this
type of data in-kernel, it would certainly be useful to a have common
in-kernel API to consume these data no matter which is the provider from
which that data is collected...

...BUT, again, in this case we do NOT even have a single user as of now
to model this intefrcae against, since we are currently NOT using SCMI
Telemetry for that...so it is seems even more a remote/impossible thing
to get something like this upstream for now...

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/20250620192813.2463367-1-cristian.marussi@arm.com/


