import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import CreatePageDialog from "@/components/create-page-dialog";

export default function Dashboard() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Pages</h1>
          <p className="text-muted-foreground">Manage website pages</p>
        </div>

        <CreatePageDialog />
      </div>

      <div className="grid gap-4 md:grid-cols-4">
        <StatCard title="Pages" value="4" />
        <StatCard title="Components" value="6" />
        <StatCard title="SubComponents" value="5" />
        <StatCard title="Content Blocks" value="4" />
      </div>
    </div>
  );
}

function StatCard({ title, value }: { title: string; value: string }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-sm">{title}</CardTitle>
      </CardHeader>
      <CardContent>
        <p className="text-2xl font-bold">{value}</p>
      </CardContent>
    </Card>
  );
}
