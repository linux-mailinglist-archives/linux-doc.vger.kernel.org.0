Return-Path: <linux-doc+bounces-18719-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AA290B3ED
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 17:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0523F1F29F45
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 15:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE2315E5AA;
	Mon, 17 Jun 2024 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3ezqbkB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8015DBCE
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635289; cv=none; b=rng1ZShn4IRwDyfWYGVW/OlmkFZuWevJT97fVEFau++vUTKsf5aSOAbgPXBZ1+OKDmCnWNPObTVgbTPcvLsIzyipnw/PhQJB5SqjCvVNUTME8PC3ERtIo0ujv3abkcFetrjrPhNZ2l060wHW8F589qIqNr2HAkwdQrYPJtjw4G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635289; c=relaxed/simple;
	bh=QW5oWZ8gmTw6vFjOs2TBVrkH9y+MYMdSSUWbhgEl4xs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZFHntcAymw7TSRBqqsTJQDLmhYot9RXvx5Vte4Q6QNMxJjo0rY2GQVZGmcM87h/v5vPQ+XUt95OX989sjpYJ5QJRSXfwg84oqp1Mj1NdMZDXB64vHZcTYNN/BW7HHCiOPPZ2avS3lMlWDsGvczPeVC+17RiZvm64+GYBgMQq358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3ezqbkB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718635287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBjPYXeV0EWopTwsNRqGM0mNGcDnahH8FozbM0iNvCA=;
	b=F3ezqbkBj8FzSzgmGjD/8QViLRW3OuUU+iJCDxC4HDZCb8q35FuHp2oqJMefZdYOJnns3w
	bEsUzeZB4XrP6KF+1kX15KFif8EWt+i6wSjum093K21xAI1A0sWrjPsVL2PMarz8+fp4BQ
	5eZXBBx9IP6NmEKc3kxhypkiDXtOScI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-yvPWStyWOEuXkLHKYogjIA-1; Mon,
 17 Jun 2024 10:41:23 -0400
X-MC-Unique: yvPWStyWOEuXkLHKYogjIA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B341119560B6;
	Mon, 17 Jun 2024 14:41:21 +0000 (UTC)
Received: from llong.com (unknown [10.22.32.57])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C5C11956048;
	Mon, 17 Jun 2024 14:41:19 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xavier <ghostxavier@sina.com>,
	Peter Hunt <pehunt@redhat.com>,
	Petr Malat <oss@malat.biz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-cgroup v2 5/5] selftest/cgroup: Update test_cpuset_prs.sh to match changes
Date: Mon, 17 Jun 2024 10:39:45 -0400
Message-Id: <20240617143945.454888-6-longman@redhat.com>
In-Reply-To: <20240617143945.454888-1-longman@redhat.com>
References: <20240617143945.454888-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Unlike the list of isolated CPUs, it is not easy to programamatically
determine what sched domains are being created by the scheduler just
by examinng the data in various kernfs filesystems. The easiest way
to get this information is by enabling /sys/kernel/debug/sched/verbose
file to make those information displayed in the console. This is also
what the test_cpuset_prs.sh script is doing when the -v flag is given.

It is rather hard to fetch the data from the console and compare it to
the expected result. An easier way is to dump the expected sched-domain
information out to the console so that they can be visually compared
with the actual sched domain data. However, this have to be done manually
by visual inspection and so will only be done once in a while.

Moreover the preceding cpuset commits also change the cpuset behavior
requiring corresponding chanages in some test cases as well as new test
cases to test the newly added functionality.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 .../selftests/cgroup/test_cpuset_prs.sh       | 55 ++++++++++++++-----
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 96bf2b5c5eb6..7c08cc153367 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -169,6 +169,14 @@ test_add_proc()
 #  T    = put a task into cgroup
 #  O<c>=<v> = Write <v> to CPU online file of <c>
 #
+# ECPUs    - effective CPUs of cpusets
+# Pstate   - partition root state
+# ISOLCPUS - isolated CPUs (<icpus>[,<icpus2>])
+#
+# Note that if there are 2 fields in ISOLCPUS, the first one is for
+# sched-debug matching which includes offline CPUs and single-CPU partitions
+# while the second one is for matching cpuset.cpus.isolated.
+#
 SETUP_A123_PARTITIONS="C1-3:P1:S+ C2-3:P1:S+ C3:P1"
 TEST_MATRIX=(
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
@@ -228,23 +236,29 @@ TEST_MATRIX=(
 	" C0-3:S+ C1-3:S+ C2-3     .    X2-3  X2-3:P2   .      .     0 A1:0-1,A2:2-3,A3:2-3 A1:P0,A2:P2 2-3"
 	" C0-3:S+ C1-3:S+ C2-3     .    X2-3   X3:P2    .      .     0 A1:0-2,A2:3,A3:3 A1:P0,A2:P2 3"
 	" C0-3:S+ C1-3:S+ C2-3     .    X2-3   X2-3  X2-3:P2   .     0 A1:0-1,A2:1,A3:2-3 A1:P0,A3:P2 2-3"
-	" C0-3:S+ C1-3:S+ C2-3     .    X2-3   X2-3 X2-3:P2:C3 .     0 A1:0-2,A2:1-2,A3:3 A1:P0,A3:P2 3"
+	" C0-3:S+ C1-3:S+ C2-3     .    X2-3   X2-3 X2-3:P2:C3 .     0 A1:0-1,A2:1,A3:2-3 A1:P0,A3:P2 2-3"
 	" C0-3:S+ C1-3:S+ C2-3   C2-3     .      .      .      P2    0 A1:0-3,A2:1-3,A3:2-3,B1:2-3 A1:P0,A3:P0,B1:P-2"
 	" C0-3:S+ C1-3:S+ C2-3   C4-5     .      .      .      P2    0 B1:4-5 B1:P2 4-5"
 	" C0-3:S+ C1-3:S+ C2-3    C4    X2-3   X2-3  X2-3:P2   P2    0 A3:2-3,B1:4 A3:P2,B1:P2 2-4"
 	" C0-3:S+ C1-3:S+ C2-3    C4    X2-3   X2-3 X2-3:P2:C1-3 P2  0 A3:2-3,B1:4 A3:P2,B1:P2 2-4"
 	" C0-3:S+ C1-3:S+ C2-3    C4    X1-3  X1-3:P2   P2     .     0 A2:1,A3:2-3 A2:P2,A3:P2 1-3"
 	" C0-3:S+ C1-3:S+ C2-3    C4    X2-3   X2-3  X2-3:P2 P2:C4-5 0 A3:2-3,B1:4-5 A3:P2,B1:P2 2-5"
+	" C4:X0-3:S+ X1-3:S+ X2-3  .      .      P2     .      .     0 A1:4,A2:1-3,A3:1-3 A2:P2 1-3"
+	" C4:X0-3:S+ X1-3:S+ X2-3  .      .      .      P2     .     0 A1:4,A2:4,A3:2-3 A3:P2 2-3"
 
 	# Nested remote/local partition tests
 	" C0-3:S+ C1-3:S+ C2-3   C4-5   X2-3  X2-3:P1   P2     P1    0 A1:0-1,A2:,A3:2-3,B1:4-5 \
 								       A1:P0,A2:P1,A3:P2,B1:P1 2-3"
 	" C0-3:S+ C1-3:S+ C2-3    C4    X2-3  X2-3:P1   P2     P1    0 A1:0-1,A2:,A3:2-3,B1:4 \
 								       A1:P0,A2:P1,A3:P2,B1:P1 2-4,2-3"
+	" C0-3:S+ C1-3:S+ C2-3    C4    X2-3  X2-3:P1    .     P1    0 A1:0-1,A2:2-3,A3:2-3,B1:4 \
+								       A1:P0,A2:P1,A3:P0,B1:P1"
 	" C0-3:S+ C1-3:S+  C3     C4    X2-3  X2-3:P1   P2     P1    0 A1:0-1,A2:2,A3:3,B1:4 \
 								       A1:P0,A2:P1,A3:P2,B1:P1 2-4,3"
 	" C0-4:S+ C1-4:S+ C2-4     .    X2-4  X2-4:P2  X4:P1    .    0 A1:0-1,A2:2-3,A3:4 \
 								       A1:P0,A2:P2,A3:P1 2-4,2-3"
+	" C0-4:S+ C1-4:S+ C2-4     .    X2-4  X2-4:P2 X3-4:P1   .    0 A1:0-1,A2:2,A3:3-4 \
+								       A1:P0,A2:P2,A3:P1 2"
 	" C0-4:X2-4:S+ C1-4:X2-4:S+:P2 C2-4:X4:P1 \
 				   .      .      X5      .      .    0 A1:0-4,A2:1-4,A3:2-4 \
 								       A1:P0,A2:P-2,A3:P-1"
@@ -270,8 +284,8 @@ TEST_MATRIX=(
 			    .      .    X2-3    P2      .      .     0 A1:0-2,A2:3,XA2:3 A2:P2 3"
 
 	# Invalid to valid local partition direct transition tests
-	" C1-3:S+:P2 C2-3:X1:P2 .  .      .      .      .      .     0 A1:1-3,XA1:1-3,A2:2-3:XA2: A1:P2,A2:P-2 1-3"
-	" C1-3:S+:P2 C2-3:X1:P2 .  .      .    X3:P2    .      .     0 A1:1-2,XA1:1-3,A2:3:XA2:3 A1:P2,A2:P2 1-3"
+	" C1-3:S+:P2 X4:P2  .      .      .      .      .      .     0 A1:1-3,XA1:1-3,A2:1-3:XA2: A1:P2,A2:P-2 1-3"
+	" C1-3:S+:P2 X4:P2  .      .      .    X3:P2    .      .     0 A1:1-2,XA1:1-3,A2:3:XA2:3 A1:P2,A2:P2 1-3"
 	"  C0-3:P2   .      .    C4-6   C0-4     .      .      .     0 A1:0-4,B1:4-6 A1:P-2,B1:P0"
 	"  C0-3:P2   .      .    C4-6 C0-4:C0-3  .      .      .     0 A1:0-3,B1:4-6 A1:P2,B1:P0 0-3"
 	"  C0-3:P2   .      .  C3-5:C4-5  .      .      .      .     0 A1:0-3,B1:4-5 A1:P2,B1:P0 0-3"
@@ -282,21 +296,18 @@ TEST_MATRIX=(
 	" C0-3:X1-3:S+:P2 C1-3:X2-3:S+:P2 C2-3:X3:P2 \
 				   .      .     X4      .      .     0 A1:1-3,A2:1-3,A3:2-3,XA2:,XA3: A1:P2,A2:P-2,A3:P-2 1-3"
 	" C0-3:X1-3:S+:P2 C1-3:X2-3:S+:P2 C2-3:X3:P2 \
-				   .      .     C4      .      .     0 A1:1-3,A2:1-3,A3:2-3,XA2:,XA3: A1:P2,A2:P-2,A3:P-2 1-3"
+				   .      .    C4:X     .      .     0 A1:1-3,A2:1-3,A3:2-3,XA2:,XA3: A1:P2,A2:P-2,A3:P-2 1-3"
 	# Local partition CPU change tests
 	" C0-5:S+:P2 C4-5:S+:P1 .  .      .    C3-5     .      .     0 A1:0-2,A2:3-5 A1:P2,A2:P1 0-2"
 	" C0-5:S+:P2 C4-5:S+:P1 .  .    C1-5     .      .      .     0 A1:1-3,A2:4-5 A1:P2,A2:P1 1-3"
 
 	# cpus_allowed/exclusive_cpus update tests
 	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3 \
-				   .     C4      .      P2     .     0 A1:4,A2:4,XA2:,XA3:,A3:4 \
+				   .    X:C4     .      P2     .     0 A1:4,A2:4,XA2:,XA3:,A3:4 \
 								       A1:P0,A3:P-2"
 	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3 \
 				   .     X1      .      P2     .     0 A1:0-3,A2:1-3,XA1:1,XA2:,XA3:,A3:2-3 \
 								       A1:P0,A3:P-2"
-	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3 \
-				   .      .     C3      P2     .     0 A1:0-2,A2:0-2,XA2:3,XA3:3,A3:3 \
-								       A1:P0,A3:P2 3"
 	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3 \
 				   .      .     X3      P2     .     0 A1:0-2,A2:1-2,XA2:3,XA3:3,A3:3 \
 								       A1:P0,A3:P2 3"
@@ -304,10 +315,7 @@ TEST_MATRIX=(
 				   .      .     X3      .      .     0 A1:0-3,A2:1-3,XA2:3,XA3:3,A3:2-3 \
 								       A1:P0,A3:P-2"
 	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3:P2 \
-				   .      .     C3      .      .     0 A1:0-3,A2:3,XA2:3,XA3:3,A3:3 \
-								       A1:P0,A3:P-2"
-	" C0-3:X2-3:S+ C1-3:X2-3:S+ C2-3:X2-3:P2 \
-				   .     C4      .      .      .     0 A1:4,A2:4,A3:4,XA1:,XA2:,XA3 \
+				   .     X4      .      .      .     0 A1:0-3,A2:1-3,A3:2-3,XA1:4,XA2:,XA3 \
 								       A1:P0,A3:P-2"
 
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
@@ -354,6 +362,9 @@ TEST_MATRIX=(
 	"  C0-1:P1   .      .  P1:C2-3  C0-2     .      .      .     0 A1:0-2,B1:2-3 A1:P-1,B1:P-1"
 	"   C0-1     .      .  P1:C2-3  C0-2     .      .      .     0 A1:0-2,B1:2-3 A1:P0,B1:P-1"
 
+	# cpuset.cpus can overlap with sibling cpuset.cpus.exclusive but not subsumed by it
+	"   C0-3     .      .    C4-5     X5     .      .      .     0 A1:0-3,B1:4-5"
+
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
 	# Failure cases:
@@ -363,6 +374,9 @@ TEST_MATRIX=(
 
 	# Changes to cpuset.cpus.exclusive that violate exclusivity rule is rejected
 	"   C0-3     .      .    C4-5   X0-3     .      .     X3-5   1 A1:0-3,B1:4-5"
+
+	# cpuset.cpus cannot be a subset of sibling cpuset.cpus.exclusive
+	"   C0-3     .      .    C4-5   X3-5     .      .      .     1 A1:0-3,B1:4-5"
 )
 
 #
@@ -564,14 +578,15 @@ check_cgroup_states()
 	do
 		set -- $(echo $CHK | sed -e "s/:/ /g")
 		CGRP=$1
+		CGRP_DIR=$CGRP
 		STATE=$2
 		FILE=
 		EVAL=$(expr substr $STATE 2 2)
-		[[ $CGRP = A2 ]] && CGRP=A1/A2
-		[[ $CGRP = A3 ]] && CGRP=A1/A2/A3
+		[[ $CGRP = A2 ]] && CGRP_DIR=A1/A2
+		[[ $CGRP = A3 ]] && CGRP_DIR=A1/A2/A3
 
 		case $STATE in
-			P*) FILE=$CGRP/cpuset.cpus.partition
+			P*) FILE=$CGRP_DIR/cpuset.cpus.partition
 			    ;;
 			*)  echo "Unknown state: $STATE!"
 			    exit 1
@@ -595,6 +610,16 @@ check_cgroup_states()
 				;;
 		esac
 		[[ $EVAL != $VAL ]] && return 1
+
+		#
+		# For root partition, dump sched-domains info to console if
+		# verbose mode set for manual comparison with sched debug info.
+		#
+		[[ $VAL -eq 1 && $VERBOSE -gt 0 ]] && {
+			DOMS=$(cat $CGRP_DIR/cpuset.cpus.effective)
+			[[ -n "$DOMS" ]] &&
+				echo " [$CGRP] sched-domain: $DOMS" > $CONSOLE
+		}
 	done
 	return 0
 }
-- 
2.39.3


